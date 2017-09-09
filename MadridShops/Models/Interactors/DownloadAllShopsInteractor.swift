//
//  DownloadAllShopsInteractor.swift
//  MadridShops
//
//  Created by Alan Casas on 7/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    func execute( onSuccess: @escaping ( Shops ) -> Void, onError: errorClosure )
    func execute( onSuccess: @escaping ( Shops ) -> Void)
}






































