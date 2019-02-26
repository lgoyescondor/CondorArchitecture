//
//  HeroesRepositoryProtocol.swift
//  CoreLayer
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import RxSwift

public protocol HeroesRepositoryProtocol {
    func getHeroes() -> Observable<[String]>
}
