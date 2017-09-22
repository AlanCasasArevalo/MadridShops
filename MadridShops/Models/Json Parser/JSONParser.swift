//
//  JSONParser.swift
//  MadridShops
//
//  Created by Alan Casas on 12/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

func parseShops (data: Data) -> Shops{
    let shops = Shops()

    do{
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String,Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJSON in result{
            let shop = Shop(name: shopJSON["name"]! as! String)
            shop.address = shopJSON["address"]! as! String
            shop.logo = (shopJSON["logo_img"] as! String)
            shop.image = (shopJSON["img"] as! String)
            shop.description = shopJSON["description_en"] as! String
            shops.add(shop: shop)
            
        }
    }catch{
        print("Error al parsear el JSON")
    }
    return shops
}


















