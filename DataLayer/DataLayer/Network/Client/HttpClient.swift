//
//  HttpClient.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift

public protocol ClientProtocol {
    func request<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response>
    func upload<Response>(_ endpoint: Endpoint<Response>) -> Observable<Response>
}
