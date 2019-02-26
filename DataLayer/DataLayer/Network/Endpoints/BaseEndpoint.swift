//
//  BaseEndpoint.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Alamofire

public class Endpoint<Response> {
    public let method: HTTPMethod
    public let relativePath: String
    public let parameters: [String: Any]?
    public let parameterEncoding: ParameterEncoding
    public let decode: (Data) throws -> Response

    public init(method: HTTPMethod = .get, relativePath: String, parameters: [String: Any]? = nil, parameterEncoding: ParameterEncoding = URLEncoding.default, decode: @escaping (Data) throws -> Response) {
        self.method = method
        self.relativePath = relativePath
        self.parameters = parameters
        self.parameterEncoding = parameterEncoding
        self.decode = decode
    }
}

extension Endpoint where Response: Decodable {
    convenience public init(method: HTTPMethod = .get, relativePath: String, parameters: [String: Any]? = nil, parameterEncoding: ParameterEncoding = URLEncoding.default) {
        self.init(method: method, relativePath: relativePath, parameters: parameters, parameterEncoding: parameterEncoding) {
            let decoder = JSONDecoder()
            return try decoder.decode(Response.self, from: $0)
        }
    }
}

extension Endpoint where Response == Void {
    convenience public init(method: HTTPMethod = .get, relativePath: String, parameters: [String: Any]? = nil, parameterEncoding: ParameterEncoding = URLEncoding.default) {
        self.init(method: method, relativePath: relativePath, parameters: parameters, parameterEncoding: parameterEncoding) { _ in }
    }
}
