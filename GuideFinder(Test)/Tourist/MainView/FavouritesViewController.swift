//
//  FavouritesViewController.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 19/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import UIKit

class FavouritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: false)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(false)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
