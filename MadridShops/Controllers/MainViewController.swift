		//
//  MainViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 11/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import RSLoadingView
import CoreData

class MainViewController: UIViewController {
    var view1 = UIView()
    var view2 = UIView()

    var context:NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        showOnWindow()
        
        let rect1 = CGRect(x: 20, y: 20, width: 300, height: 200)
        view1 = UIView(frame: rect1)
        view1.backgroundColor = UIColor.brown
        self.view.addSubview(view1)
        
        let rect2 = CGRect(x: 300, y: 400, width: 200, height: 100)
        view2 = UIView(frame: rect2)
        view2.backgroundColor = UIColor.cyan
        self.view.addSubview(view2)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(animateView))
        tapGesture.numberOfTapsRequired = 1 //Numero de veces que golpeamos la pantallas
        tapGesture.numberOfTouchesRequired = 1  //Numero de dedos
        
        view1.addGestureRecognizer(tapGesture)
        
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
    
    @objc func animateView(){
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue"{
            let vc = segue.destination as! ViewController
            vc.context = self.context
        }
    }
    
}

































