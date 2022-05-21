//
//  LeaguesViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 14/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher
import CoreData
import Network


class LeaguesViewController: UIViewController {
  
    var leagues : [League] = []
    var context: NSManagedObjectContext!
      
   var sportName="Soccer"
    var flag = "all"
    var leaguesList:[LeaguesModel] = []
    var leaguesPresenter:LeaguesProtocol?
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var contextView :NSManagedObjectContext?
    var moviesForDataBase:[NSManagedObject]=[]
    let monitor = NWPathMonitor()
    @IBOutlet weak var tableView : UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        leaguesPresenter = LeaguesPresenter()
        let connectionState = InternetConnectionManager.isConnectedToNetwork()
        print("connection",connectionState)
        if connectionState {
            tableView.isHidden = false
            setup()
        let myUrl = "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s="
                  leaguesPresenter?.getLeagues(parameters: sportName ,url: myUrl, completionHandler: { [weak self] leagues, error in
                      print("Completion handler ")
                      if let error = error {
                          print(error)
                      } else {
                          guard let resualt = leagues else { return }
                          self?.leaguesList = resualt.countries ?? []
                          self!.tableView.reloadData()
                          print(resualt)
                          
                         
                      }
                  })
        }else{
            tableView.isHidden = true
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
            let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
            imageViewBackground.image = UIImage(named: "noConnection.jpg")
            imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFit
            self.view.addSubview(imageViewBackground)
            self.view.sendSubviewToBack(imageViewBackground)
            
        }
        
        
      

    }
    
    
    
    
    


    func showAlert(){
       let alert : UIAlertController = UIAlertController(title: "warning", message: "Sorry but this League has no video on Youtube", preferredStyle: .actionSheet)
                alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
        present(alert,animated: true,completion: nil)
    }
    
    
 
    
    func fetchAllLeagues(){
         do {
             leagues = try context.fetch(League.fetchRequest())
            print("league count \(leagues.count)")
         } catch {
             print("Error fetching todos")
         }
     }
    

 
}


