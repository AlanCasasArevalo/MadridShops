//
//  ViewController.swift
//  MadridShops
//
//  Created by Alan Casas on 7/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import UIKit
import CoreData
import CoreLocation
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    @IBOutlet weak var mapView: MKMapView!
    
    var context:NSManagedObjectContext!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.requestWhenInUseAuthorization()
        
        ExecuteOnceInteractorImplementation().execute {
            initializeData()
        }

        self.shopsCollectionView.delegate = self
        self.shopsCollectionView.dataSource = self
        
        let madridLocation = CLLocation(latitude: 40.416775, longitude: -3.703790)
        self.mapView.setCenter(madridLocation.coordinate, animated: true)
        self.locationManager.delegate = self
        self.locationManager.startUpdatingHeading()
        
    }
    
    func initializeData(){
        let downloadShopsInteractor:DownloadAllShopsInteractor = DownloadAllShopsInteractorURLSessionImpl()
        
        downloadShopsInteractor.execute { (shops:Shops) in
            let cacheInteractor = SaveAllShopsInteractorImplementation()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                
                SetExecutedOnceInteractorImplementation().execute()
                
                self._fetchedResultsController = nil
                self.shopsCollectionView.delegate = self
                self.shopsCollectionView.dataSource = self
                self.shopsCollectionView.reloadData()
            })
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "shopDetailSegue"{
            let indexPath = shopsCollectionView.indexPathsForSelectedItems![0]
            let vc = segue.destination as! ShopDetailViewController
//            let shop = self.shops?.get(index: indexPath.row)
            let shop = self.fetchedResultsController.object(at: indexPath)
            vc.shop = mapShopCoreDataIntoShop(shopCD: shop)
        }
    }
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCoreData>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShopCoreData> {
        if (_fetchedResultsController != nil) {
            return _fetchedResultsController!
        }
        let fetchRequest: NSFetchRequest<ShopCoreData> = ShopCoreData.fetchRequest()
        fetchRequest.fetchBatchSize = 20
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "nameCD", ascending: true)]
        let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        //        aFetchedResultsController.delegate = self
        _fetchedResultsController = aFetchedResultsController
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return _fetchedResultsController!
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        self.mapView.setCenter(location.coordinate, animated: true)
    }
    
}

























