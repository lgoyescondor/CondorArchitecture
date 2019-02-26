//
//  HeroesRepository.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer

public class HeroesRepository : HeroesRepositoryProtocol {
    public init() { }
    
    public func getHeroes() -> [String] {
        return ["Superman", "Daredevil"]
    }
}
