//
//  Interactor.swift
//  CoreLayer
//
//  Created by user149842 on 2/24/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift

protocol InteractorProtocol {
    associatedtype P
    associatedtype R
    func execute(params: P, onSuccess: @escaping (R?) -> (), onError: @escaping (Error) -> ()) -> Disposable
}

public class ObservableInteractor<Response, Params>: InteractorProtocol {
    typealias P = Params
    typealias R = Response

    public init() { }

    public func execute(params: Params, onSuccess: @escaping (Response?) -> (), onError: @escaping (Error) -> ()) -> Disposable {

        return buildUseCase(params: params)
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .subscribe(onNext: onSuccess, onError: onError)
    }

    public func buildUseCase(params: Params) -> Observable<Response> {
        return Observable<Response>.create({ emitter in
            return Disposables.create()
        })
    }
}
