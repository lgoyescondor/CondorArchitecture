//
//  ViewController.swift
//  CondorArchitecture
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    private var presenter: ExamplePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ExamplePresenter()

    }


}

