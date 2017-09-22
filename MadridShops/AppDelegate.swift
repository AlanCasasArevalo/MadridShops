//
//  AppDelegate.swift
//  MadridShops
//
//  Created by Alan Casas on 7/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreDataStack = CoreDataStack()
    var context:NSManagedObjectContext?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        self.context = coreDataStack.createContainer(dataBaseName: "MadridShops").viewContext
        let navVC = self.window?.rootViewController as! UINavigationController
        let mainVC = navVC.topViewController as! MainViewController
        mainVC.context = self.context
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        guard let context = self.context else { return  }
        self.coreDataStack.saveContext(context: context)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}








