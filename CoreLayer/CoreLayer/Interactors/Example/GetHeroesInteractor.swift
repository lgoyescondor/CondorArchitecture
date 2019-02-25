//
//  GetHeroesInteractor.swift
//  CoreLayer
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

public class GetHeroesInteractor: Interactor<[String], Any?>{
    
    let heroesRepository: HeroesRepositoryProtocol
    
    public init(heroesRepository: HeroesRepositoryProtocol){
        self.heroesRepository = heroesRepository
    }
    
    public override func buildUseCase(params: Any?) throws -> [String]? {
        return self.heroesRepository.getHeroes()
    }
}
