//
//  DownloadAllShopsInteractorFackeImplementation.swift
//  MadridShops
//
//  Created by Alan Casas on 9/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class DownloadAllShopsInteractorFackeImplementation: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }

    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \(i)")
            shop.name = " Zara \( i ) "
            shop.address = "Address \( 1 )"
            shop.image = "ranaFotografa"
            shop.openingHours = "09:00 - 14:00  17:00 - 20:30"
            shop.description = "Nuestra tienda es una prestigiosa marca de ropa de la mas alta gama."

            
            shops.add(shop: shop)
        }
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
}













