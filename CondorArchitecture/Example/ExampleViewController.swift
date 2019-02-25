//
//  ViewController.swift
//  CondorArchitecture
//
//  Created by user149842 on 2/23/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    private var presenter: ExamplePresenterProtocol?
    
    @IBOutlet weak var heroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = ExamplePresenter()
        self.presenter?.bind(view: self)
    }
    
    deinit {
        self.presenter?.unBind()
    }
}

extension ExampleViewController : ExampleView {
    func setHeroLabel(text: String){
        self.heroLabel?.text = text
    }
}

