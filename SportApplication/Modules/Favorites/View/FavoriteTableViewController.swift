//
//  FavoriteTableViewController.swift
//  SportApplication
//
//  Created by Rana on 5/20/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import CoreData

class FavoriteTableViewController: UITableViewController {

    var leagues : [League] = []
    let connectionState = InternetConnectionManager.isConnectedToNetwork()

    var context: NSManagedObjectContext!

 
    override func viewDidLoad() {
        tableView.rowHeight = 85
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        super.viewDidLoad()
        
        if connectionState {
            tableView.isHidden = false
            fetchAllLeagues()
            
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return leagues.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteLeaguesTableViewCell", for: indexPath) as! FavoriteTableViewCell
            cell.leagueName.text = leagues[indexPath.section].leagueName
                              cell.layer.cornerRadius = 15
//                              if leagues[indexPath.section].leagueYoutubeLink == ""{
//                              }else{
//                                  cell. = leagues[indexPath.section].leagueYoutubeLink ?? ""
//                              }
                              
                             let url = leagues[indexPath.section].leagueBadge
                             cell.leagueImg.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
        leagueDetailsViewController.leagueId = leagues[indexPath.section].leagueId
                   leagueDetailsViewController.leagueName = leagues[indexPath.section].leagueName
                   leagueDetailsViewController.leagueBadge = leagues[indexPath.section].leagueBadge
                                                     leagueDetailsViewController.leagueYoutubeLink = leagues[indexPath.section].leagueYoutubeLink
        self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)

    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
                 return 10
             }
       
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                 if editingStyle == .delete {
                    
                        print("deleting \(leagues[indexPath.section].leagueName)")
                         
                                             context.delete(leagues[indexPath.section])
                         
                                             do {
                                                 try context.save()
                                                 leagues.remove(at: indexPath.section)
                                             } catch {
                                                 print("Error deleting todo")
                                             }
                         
                                             DispatchQueue.main.async {
                                                tableView.deleteSections([indexPath.section], with: .fade)
                                             }
    //
                                         
                    }
                 
            }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchAllLeagues(){
            do {
                leagues = try context.fetch(League.fetchRequest())
               print("league count \(leagues.count)")
            } catch {
                print("Error fetching todos")
            }
        }
}
