//
//  ExecuteOnceInteractorImplementation.swift
//  MadridShops
//
//  Created by Alan Casas on 19/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

class ExecuteOnceInteractorImplementation : ExecuteOnceInteractorProtocol{
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard
        
        if let _ = defaults.string(forKey: "once") {
        }else{
            closure()
        }
    }
}









