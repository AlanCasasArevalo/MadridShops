//
//  ShopDetailViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 12/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

class ShopDetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var textView: UITextView!
    
    var shop: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.shop?.name
        
        self.shop?.image.loadImage(into: image)
        
        self.textView.text = shop?.description
    }
    
}
