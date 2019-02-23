//
//  HeroesRepository.swift
//  DataLayer
//
//  Created by user149842 on 2/23/19.
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
