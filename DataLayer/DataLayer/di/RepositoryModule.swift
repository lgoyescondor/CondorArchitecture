//
//  RepositoryModule.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer

public class RepositoryModule {

    public init() { }

    public lazy var heroesRespository: HeroesRepositoryProtocol = {
        return MockedHeroesRepository()
    }()
}
