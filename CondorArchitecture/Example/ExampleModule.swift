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
        
        let presenter = ExamplePresenter(getHeroesInteractor: interactorModule.getHeroesInteractor)
        
        (viewController as? ExampleViewController)?.presenter = presenter
    }
}
