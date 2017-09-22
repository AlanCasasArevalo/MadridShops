//
//  SetExecutedOnceInteractorImplementation.swift
//  MadridShops
//
//  Created by Alan Casas on 19/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation

class SetExecutedOnceInteractorImplementation : SetExecutedOnceInteractorProtocol{
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey: "once")
        
        defaults.synchronize()
    }
}











