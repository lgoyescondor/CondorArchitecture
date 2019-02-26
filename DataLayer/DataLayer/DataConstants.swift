//
//  DataConstants.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

struct DataConstants {
    struct APIurl {
        static let base: String = "https://reqres.in/"
    }
    struct APIClient {
        struct UserServices{
            static let listUsers = "api/users?page=2"
        }
    }
}
