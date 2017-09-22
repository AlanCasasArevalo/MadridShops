//
//  SaveAllShopsInteractorImplementation.swift
//  MadridShops
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation
import CoreData

class SaveAllShopsInteractorImplementation: SaveAllShopsInteractor {
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        
        for i in 0 ..< shops.count() {
            let shop = shops.get(index: i)
            let _ = mapShopintoShopCoreData(context: context, shop: shop)
        }
        do {
            try context.save()
            onSuccess(shops)
        } catch  {
            print("Error")
        }
    }
    
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void) {
        execute(shops: shops, context: context, onSuccess: onSuccess, onError: nil)
    }
}





























