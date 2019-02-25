//
//  InteractorModule+Example.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import CoreLayer

protocol ExampleInteractorModule {
    var getHeroesInteractor: Interactor<[String], Any?> { get }
}

extension InteractorModule: ExampleInteractorModule {
    var getHeroesInteractor: Interactor<[String], Any?> {
        return GetHeroesInteractor(heroesRepository: repositoryModule.heroesRespository)
    }
}
