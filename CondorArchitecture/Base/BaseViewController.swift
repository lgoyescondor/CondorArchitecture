//
//  BaseViewController.swift
//  CondorArchitecture
//
//  Created by Luis David Goyes Garces on 2/25/19.
//  Copyright © 2019 Condor Labs. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, BaseView {
    var presenter: BasePresenterProtocol?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.ownInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.ownInit()
    }

    private func ownInit() {
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let className = NSStringFromClass(self.classForCoder)
        
        guard let module = delegate.viewControllerComponent.modules[className] else {
            return
        }
        
        module.inject(viewController: self)
    }
}
