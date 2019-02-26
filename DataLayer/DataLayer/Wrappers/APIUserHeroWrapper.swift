//
//  APIUserHeroWrapper.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer

class APIUserHeroWrapper {
    static func map(_ i: APIUser) -> Hero {
        return Hero(fullName: i.firstName + " " + i.lastName)
    }
}
