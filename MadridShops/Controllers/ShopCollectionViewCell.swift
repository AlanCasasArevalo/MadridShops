//
//  ShopCollectionViewCell.swift
//  MadridShops
//
//  Created by Alan Casas on 9/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {

    var shop: Shop?
    
    @IBOutlet weak var shopImage: UIImageView!
    
    @IBOutlet weak var shopLabel: UILabel!
    
    func refresh(shop:Shop) {
        self.shop = shop
        
        self.shopLabel.text = shop.name
        
        
    }
    
    
}
