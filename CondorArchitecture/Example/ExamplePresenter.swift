//
//  ExamplePresenter.swift
//  CondorArchitecture
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation
import CoreLayer
import DataLayer

class ExamplePresenter {

    let heroesRepository : HeroesRepositoryProtocol
    let getHeroesInteractor : GetHeroesInteractor
    
    private weak var view: ExampleView?
    
    init(){
        heroesRepository = HeroesRepository()
        getHeroesInteractor = GetHeroesInteractor(heroesRepository: heroesRepository)
    }
    
    private func getHeroes() {
        let message = self.getHeroesInteractor.getHeroes().reduce("") { (result, hero) in
            return result + (result.isEmpty ? "" : ", ") + hero
        }
        
        view?.setHeroLabel(text: message)
    }
}

extension ExamplePresenter : ExamplePresenterProtocol{
    func bind(view: ExampleView){
        self.view = view
        
        self.getHeroes()
    }
    
    func unBind(){
        self.view = nil
    }
}
