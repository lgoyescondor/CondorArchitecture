//
//  Interactor.swift
//  CoreLayer
//
//  Created by user149842 on 2/24/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

protocol InteractorProtocol {
    associatedtype P
    associatedtype R
    func execute( params: P, onSuccess: @escaping  (R?)->(), onError: @escaping (Error)->() )
}

public class Interactor<Response, Params>: InteractorProtocol {
    
    typealias P = Params
    typealias R = Response
    
    public init() { }
    
    public func execute(params: Params, onSuccess: @escaping (Response?) -> (), onError: @escaping (Error) -> ()) {
        do {
            onSuccess( try self.buildUseCase(params: params) )
        }catch{
            onError(error)
        }
    }
    
    public func buildUseCase(params: Params) throws -> Response? {
        return nil
    }
}
