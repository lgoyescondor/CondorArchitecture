//
//  HttpClient.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
import CoreLayer

public protocol HttpClientProtocol {
    func request<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response>
}

public class HttpClient: HttpClientProtocol {

    public let baseURL: URL?
    public let manager: SessionManager

    public init(baseURL: String) {
        self.baseURL = URL(string: baseURL)
        let configuration = URLSessionConfiguration.default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        self.manager = SessionManager(configuration: configuration)
    }

    public func request<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response> {
        return Observable<Response>.create({ emitter in
            guard let url = self.url(path: endpoint.relativePath) else {
                emitter.onError(CoreLayer.CustomErrors.ApiRequest.malformedURL)
                return Disposables.create()
            }

            do {
                let request = self.manager.request(
                    url,
                    method: endpoint.method,
                    parameters: endpoint.parameters,
                    encoding: endpoint.parameterEncoding,
                    headers: try self.getHeaders(endpoint))

                request.validate()
                    .responseData(
                        queue: DispatchQueue.global(),
                        completionHandler: { response in
                            let result = response.result.flatMap(endpoint.decode)

                            switch result {
                            case let .success(val):
                                emitter.onNext(val)
                                emitter.onCompleted()
                            case let .failure(error_):
                                guard let error = error_ as? AFError else {
                                    emitter.onError(error_)
                                    return
                                }

                                guard let responseCode = error.responseCode else {
                                    emitter.onError(error_)
                                    return
                                }

                                emitter.onError(self.validateResponseCode(responseCode, currentError: error_))
                            }
                        })
            } catch let error {
                emitter.onError(error)
            }

            return Disposables.create()
        })
    }

    private func validateResponseCode(_ responseCode: Int, currentError: Error) -> Error {
        switch responseCode {
        case Constants.HttpStatusCodes.badRequestStatusCode:
            return CoreLayer.CustomErrors.ApiRequest.badRequest
        case Constants.HttpStatusCodes.notAuthenticatedStatusCode:
            return CoreLayer.CustomErrors.ApiRequest.missingToken
        case Constants.HttpStatusCodes.unauthorizedStatusCode:
            return CoreLayer.CustomErrors.ApiRequest.unauthorized
        default:
            return currentError
        }
    }

    private func getHeaders<Response>(_ endpoint: Endpoint<Response>) throws -> HTTPHeaders {
        return SessionManager.defaultHTTPHeaders
    }

    private func url(path: String) -> URL? {
        return baseURL?.appendingPathComponent(path)
    }
}
