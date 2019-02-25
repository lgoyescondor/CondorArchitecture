//
//  BaseContract.swift
//  CondorArchitecture
//
//  Created by user149842 on 2/24/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import Foundation

protocol BaseView : class {
    
}

protocol BasePresenterProtocol : class {
    func bind(view: BaseView)
    func unBind()
}
