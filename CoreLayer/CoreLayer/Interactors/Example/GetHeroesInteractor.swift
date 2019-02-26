//
//  GetHeroesInteractor.swift
//  CoreLayer
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift

public class GetHeroesInteractor: ObservableInteractor<[String], Any?>{
    
    let heroesRepository: HeroesRepositoryProtocol
    
    public init(heroesRepository: HeroesRepositoryProtocol){
        self.heroesRepository = heroesRepository
    }
    
    public override func buildUseCase(params: Any?) -> Observable<[String]> {
        return Observable.create({
            $0.onNext( self.heroesRepository.getHeroes() )
            $0.onCompleted()
            return Disposables.create()
        })
    }
}
