//
//  CoreDataStack.swift
//  CoreDataHelloWorld
//
//  Created by Alan Casas on 13/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import CoreData

public class CoreDataStack {
    public func createContainer(dataBaseName: String) -> NSPersistentContainer  {
        let container = NSPersistentContainer(name: dataBaseName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                self.errorMessageAlert(error: error)
            }
        })
        return container
    }
    
    func saveContext (context: NSManagedObjectContext) {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                self.errorMessageAlert(error: nserror)
            }
        }
    }
}

extension CoreDataStack{
    func errorMessageAlert(error: NSError){
        let alertController = UIAlertController(title: "Lo sentimos ha ocurrido un error con la base de datos", message: error.description, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        alertController.present(alertController, animated: true, completion: nil)
    }
}
























