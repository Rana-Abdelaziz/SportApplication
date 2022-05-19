//
//  HomeViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var homePresenter: HomeVCPresenter!
        
    
    var leagues : [League]?
//    var context: NSManagedObjectContext!
    var coreData: CoreDataServices?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        context = appDelegate.persistentContainer.viewContext
        
        setupCollectionView()
        homePresenter = HomeVCPresenter(view: self)
        homePresenter.viewDidLoad()
        
        coreData = CoreDataServices()
        
        fetchAllLeagues()
        
    }
    
    func fetchAllLeagues(){
        leagues = coreData?.fetchAllLeagues()
        print("league count \(leagues?.count)")
    }
    
//    func fetchAllLeagues(){
//        do {
//            leagues = try context.fetch(League.fetchRequest())
//            print("league count \(leagues?.count)")
//        } catch {
//            print("Error fetching todos")
//        }
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
