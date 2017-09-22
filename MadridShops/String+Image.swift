//
//  String+Image.swift
//  MadridShops
//
//  Created by Alan Casas on 13/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit

extension String {
    func loadImage(into imageView: UIImageView) {
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: self), let data = NSData(contentsOf: url), let image = UIImage(data: data as Data){
                OperationQueue.main.addOperation {
                    imageView.image = image
                }
            }
        }
        
    }
}











