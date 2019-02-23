//
//  GetHeroesInteractor.swift
//  CoreLayer
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

public class GetHeroesInteractor {
    
    let heroesRepository: HeroesRepositoryProtocol
    
    init(heroesRepository: HeroesRepositoryProtocol){
        self.heroesRepository = heroesRepository
    }
    
}
