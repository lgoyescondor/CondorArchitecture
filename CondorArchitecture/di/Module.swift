//
//  Module.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import UIKit
import DataLayer
import CoreLayer

protocol Module {
    var repositoryModule: RepositoryModule { get set }
    var interactorModule: InteractorModule { get set }

    func inject(viewController: UIViewController)
}

class AbstractModule: Module {
    var repositoryModule: RepositoryModule
    var interactorModule: InteractorModule

    init() {
        self.repositoryModule = RepositoryModule()
        self.interactorModule = InteractorModule(repositoryModule: self.repositoryModule)
    }

    func inject(viewController: UIViewController) { }
}
