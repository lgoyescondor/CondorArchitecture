//
//  MockedHeroesRepository.swift
//  DataLayer
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer
import RxSwift

public class MockedHeroesRepository : HeroesRepositoryProtocol {
    public init() { }
    
    public func getHeroes() -> Observable<[String]> {
        return Observable.create({
            $0.onNext(["Superman", "Daredevil"])
            return Disposables.create()
        })
    }
}
