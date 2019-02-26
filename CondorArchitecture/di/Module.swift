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

    init(repositoryModule: RepositoryModule, interactorModule: InteractorModule) {
        self.repositoryModule = repositoryModule
        self.interactorModule = interactorModule
    }

    func inject(viewController: UIViewController) { }
}
