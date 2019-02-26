//
//  HeroesRepository.swift
//  DataLayer
//
//  Created by Luis David Goyes Garces on 2/26/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer
import RxSwift

public class HeroesRepository: HeroesRepositoryProtocol {

    private let userService: UserServiceProtocol

    init(userService: UserServiceProtocol) {
        self.userService = userService
    }

    public func getHeroes() -> Observable<[String]> {
        return userService.getListOfUsers().map({ getListOfUsersResponse in
            var heroesNames = [String]()

            getListOfUsersResponse.data.forEach({ (apiUser) in
                heroesNames.append(APIUserHeroWrapper.map(apiUser).fullName)
            })

            return heroesNames
        })
    }
}
