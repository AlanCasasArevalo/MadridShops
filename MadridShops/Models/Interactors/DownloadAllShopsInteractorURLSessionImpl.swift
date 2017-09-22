//
//  DownloadAllShopsInteractorURLSessionImpl.swift
//  MadridShops
//
//  Created by Alan Casas on 12/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

class DownloadAllShopsInteractorURLSessionImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        
        let urlStringBackEnd = "https://madrid-shops.com/json_new/getShops.php"
        let session = URLSession.shared

        if let url = URL(string: urlStringBackEnd){
            let task = session.dataTask(with: url) { (data:Data?, response:URLResponse? , error:Error?) in
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error != nil{
                        if let onError = onError{
                            onError(error!)
                        }
                    }else{
                        
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
                    }
                }
            }
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
}
























