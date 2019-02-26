//
//  ViewControllerComponent.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import DataLayer

class ViewControllerComponent {
    private let repositoryModule: RepositoryModule
    private let interactorModule: InteractorModule
    
    var modules: [String: AbstractModule] = [String: AbstractModule]()
    
    init(){
        self.repositoryModule = RepositoryModule()
        self.interactorModule = InteractorModule(repositoryModule: self.repositoryModule)
        
        modules[NSStringFromClass(ExampleViewController.self.classForCoder())] = ExampleModule(
            repositoryModule: repositoryModule,
            interactorModule: interactorModule)
    }
}
