//
//  ExampleContract.swift
//  CondorArchitecture
//
//  Created by user149842 on 2/24/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

protocol ExampleView : class {
    func setHeroLabel(text: String)
}

protocol ExamplePresenterProtocol : class {
    func bind(view: ExampleView)
    func unBind()
}
