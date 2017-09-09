//
//  DownloadAllShopsInteractorFackeImplementation.swift
//  MadridShops
//
//  Created by Alan Casas on 9/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorFackeImplementation: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }

    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \(i)")
            shop.address = "Address \( 1 )"
            shops.add(shop: shop)
        }
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
}













