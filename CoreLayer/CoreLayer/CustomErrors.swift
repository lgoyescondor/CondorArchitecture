//
//  CustomErrors.swift
//  CoreLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

public enum CustomErrors: Error {

    public enum ApiRequest: Error {
        case unauthorized
        case malformedURL
        case missingToken
        case badRequest
    }
}
