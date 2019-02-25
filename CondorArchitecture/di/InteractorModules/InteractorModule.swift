//
//  InteractorModule.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer
import DataLayer

class InteractorModule {

    internal let repositoryModule: RepositoryModule

    init(repositoryModule: RepositoryModule) {
        self.repositoryModule = repositoryModule
    }

    lazy var getHeroesInteractor: Interactor<[String], Any?> = {
        return GetHeroesInteractor(heroesRepository: repositoryModule.heroesRespository)
    }()
}
