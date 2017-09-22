//
//  DownloadAllShopsInteractorNSOptImpl.swift
//  MadridShops
//
//  Created by Alan Casas on 12/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorNSOptImpl: DownloadAllShopsInteractor {

    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        let urlStringBackEnd = "https://madrid-shops.com/json_new/getShops.php"

        let queue = OperationQueue()
        queue.addOperation {
            if let url = URL(string: urlStringBackEnd), let data = NSData(contentsOf: url) as Data?{
                let shops = parseShops(data: data)
                
                OperationQueue.main.addOperation {
                    onSuccess(shops)
                }
            }
        }
    }
}








































