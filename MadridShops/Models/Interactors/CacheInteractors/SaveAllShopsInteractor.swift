//
//  SaveAllShopsInteractor.swift
//  MadridShops
//
//  Created by Alan Casas on 15/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import Foundation
import CoreData

protocol SaveAllShopsInteractor {
    func execute( shops:Shops, context:NSManagedObjectContext, onSuccess: @escaping ( Shops ) -> Void, onError: errorClosure )
    func execute( shops:Shops, context:NSManagedObjectContext, onSuccess: @escaping ( Shops ) -> Void)
}



























