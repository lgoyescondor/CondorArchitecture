//
//  ServiceModule.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

public class ServiceModule {
    public init() { }

    lazy var httpClient: HttpClientProtocol = {
        return HttpClient(baseURL: DataConstants.APIurl.base)
    }()

    lazy var userService: UserServiceProtocol = {
        return UserService(httpClient: httpClient)
    }()
}
