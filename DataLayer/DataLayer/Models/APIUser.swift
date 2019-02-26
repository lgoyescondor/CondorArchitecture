//
//  APIUser.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

struct APIUser: Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case id, avatar
        case firstName = "first_name"
        case lastName = "last_name"
    }
}
