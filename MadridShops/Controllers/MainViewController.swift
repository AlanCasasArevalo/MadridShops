//
//  MainViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 11/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import RSLoadingView

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showOnWindow()
    }
    
    func showOnWindow() {
        let loadingView = RSLoadingView(effectType: RSLoadingView.Effect.twins)
        loadingView.shouldTapToDismiss = true
        loadingView.variantKey = "inAndOut"
        loadingView.speedFactor = 2.0
        loadingView.lifeSpanFactor = 2.0
        loadingView.mainColor = UIColor.red
        loadingView.show(on: view)
    }
}
