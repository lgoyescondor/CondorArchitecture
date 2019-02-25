//
//  PresenterModules.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

class PresenterModule {
    private let interactorModule: InteractorModule

    init(interactorModule: InteractorModule) {
        self.interactorModule = interactorModule
    }

    func provideExamplePresenter() -> ExamplePresenterProtocol {
        return ExamplePresenter(getHeroesInteractor: interactorModule.getHeroesInteractor)
    }
}
