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
    let getHeroesInteractor : Interactor<[String], Any?>
    
    private weak var view: ExampleView?
    
    init(){
        heroesRepository = MockedHeroesRepository()
        getHeroesInteractor = GetHeroesInteractor(heroesRepository: heroesRepository)
    }
    
    private func getHeroes() {

        self.getHeroesInteractor.execute(
            params: nil,
            onSuccess: { [weak view] heroesOptional in
            guard let heroes = heroesOptional else {
                return
            }
            
            let message = heroes.reduce("") { (result, hero) in
                return result + (result.isEmpty ? "" : ", ") + hero
            }
            
            view?.setHeroLabel(text: message)
        }, onError: {
            debugPrint( $0.localizedDescription)
            })
    }
}

extension ExamplePresenter : ExamplePresenterProtocol{
    func bind(view: BaseView){
        self.view = view as? ExampleView
        
        self.getHeroes()
    }
    
    func unBind(){
        self.view = nil
    }
}
