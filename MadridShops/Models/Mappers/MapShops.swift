//
//  MapShops.swift
//  MadridShops
//
//  Created by Alan Casas on 18/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import CoreData

func mapShopCoreDataIntoShop(shopCD: ShopCoreData) -> Shop{
    let shop = Shop(name: shopCD.nameCD ?? "Empty" )
    shop.address = shopCD.addressCD ?? ""
    shop.image = shopCD.imageCD ?? ""
    shop.logo = shopCD.logoCD ?? ""
    shop.openingHours = shopCD.openingHoursCD ?? ""
    shop.description = shopCD.descriptionCD ?? ""
    shop.latitude = shopCD.latitudeCD
    shop.longitude = shopCD.longitudeCD
    
    return shop
}

func mapShopintoShopCoreData(context:NSManagedObjectContext, shop:Shop) -> ShopCoreData {
    let shopCoreData = ShopCoreData(context: context)
    shopCoreData.nameCD = shop.name
    shopCoreData.addressCD = shop.address
    shopCoreData.imageCD = shop.image
    shopCoreData.logoCD = shop.logo
    shopCoreData.openingHoursCD = shop.openingHours
    shopCoreData.descriptionCD = shop.description
    shopCoreData.latitudeCD = shop.latitude ?? 0
    shopCoreData.longitudeCD = shop.longitude ?? 0

    return shopCoreData
}









































