//
//  ViewController+CollectionViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 9/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (shops?.count())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let shopToCell = self.shops?.get(index: indexPath.row)
        
        let shopCell:ShopCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopCollectionViewCell
        
        shopCell.refresh(shop: shopToCell!)
        
        return shopCell
        
    }
    
    
}







