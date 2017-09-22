//
//  ViewController+CollectionViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 9/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import CoreData

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return (shops?.count())!
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let shopToCell = self.shops?.get(index: indexPath.row)
        
        let shopCell:ShopCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "shopCell", for: indexPath) as! ShopCollectionViewCell

        let shopCellCoreData:ShopCoreData = fetchedResultsController.object(at: indexPath)
        
        shopCell.refresh(shop: mapShopCoreDataIntoShop(shopCD: shopCellCoreData))
        
        return shopCell
    }
    
}







