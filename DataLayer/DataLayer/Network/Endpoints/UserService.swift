//
//  sUserService.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire

protocol UserServiceProtocol {
    func getListOfUsers() -> Observable<GetListOfUsersResponse>
}

final class UserService: UserServiceProtocol {

    let httpClient: HttpClientProtocol
    
    init(httpClient: HttpClientProtocol) {
        self.httpClient = httpClient
    }

    func getListOfUsers() -> Observable<GetListOfUsersResponse> {
        return httpClient.request(
            Endpoint<GetListOfUsersResponse>(
                method: .get,
                relativePath: DataConstants.APIClient.UserServices.listUsers,
                parameters: nil,
                parameterEncoding: URLEncoding.default)
        )
    }
}
