//
//  ExampleModule.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import UIKit
import CoreLayer

class ExampleModule: AbstractModule {
    override func inject(viewController: UIViewController) {
        let getHeroesInteractor = GetHeroesInteractor(heroesRepository: repositoryModule.heroesRespository)
        
        let presenter = ExamplePresenter(getHeroesInteractor: getHeroesInteractor)
        
        (viewController as? ExampleViewController)?.presenter = presenter
    }
}
