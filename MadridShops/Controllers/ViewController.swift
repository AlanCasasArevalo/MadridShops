//
//  ViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 7/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
        
    var shops:Shops?

    override func viewDidLoad() {
        super.viewDidLoad()
        let downloadShopsInteractor:DownloadAllShopsInteractor = DownloadAllShopsInteractorFackeImplementation()
//        downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
//
//        }) { (error: Error) in
//
//        }
        downloadShopsInteractor.execute { (shops:Shops) in
            print("Name " + shops.get(index: 0).name)
            self.shops = shops
            
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self

        }
    }

}

























