//
//  newFile.swift
//  SportApplication
//
//  Created by Rana on 5/18/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit


extension LeaguesViewController : UITableViewDelegate , UITableViewDataSource {
         
    func setup(){
        tableView.delegate = self
                 tableView.dataSource = self
                 tableView.rowHeight = 85
                 tableView.register(UINib(nibName: "LeaguesTableViewCell", bundle: nil), forCellReuseIdentifier: "LeaguesTableViewCell")
    }
    
         
        func numberOfSections(in tableView: UITableView) -> Int {
            switch flag {
            case "all":
                return leaguesList.count
            case "favorite":
                return leagues.count
            default:
                return leaguesList.count

            }
             
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
          }
          
          
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
           switch flag {
                     case "all":
                        leagueDetailsViewController.leagueId = leaguesList[indexPath.section].idLeague
                                   leagueDetailsViewController.leagueName = leaguesList[indexPath.section].strLeague
                                   leagueDetailsViewController.leagueBadge = leaguesList[indexPath.section].strBadge
                                   leagueDetailsViewController.leagueYoutubeLink = leaguesList[indexPath.section].strYoutube
                        
           case "favorite":
            leagueDetailsViewController.leagueId = leaguesList[indexPath.section].idLeague
            leagueDetailsViewController.leagueName = leagues[indexPath.section].leagueName
            leagueDetailsViewController.leagueBadge = leagues[indexPath.section].leagueBadge
                                              leagueDetailsViewController.leagueYoutubeLink = leagues[indexPath.section].leagueYoutubeLink
                     default:
                        
                        leagueDetailsViewController.leagueId = leaguesList[indexPath.section].idLeague
                        leagueDetailsViewController.leagueName = leaguesList[indexPath.section].strLeague
                        leagueDetailsViewController.leagueBadge = leaguesList[indexPath.section].strBadge
                        leagueDetailsViewController.leagueYoutubeLink = leaguesList[indexPath.section].strYoutube
                     }
           
            
//            self.navigationController?.present(leagueDetailsViewController, animated: true)
            self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)
            
        }
    
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
            
            //check flag at first
            
            switch flag {
                   case "all":
                cell.title.text = leaguesList[indexPath.section].strLeague
                        cell.layer.cornerRadius = 15
                        if leaguesList[indexPath.section].strYoutube == ""{
                        }else{
                            cell.youtubeLink = leaguesList[indexPath.section].strYoutube ?? ""
                        }
                        
                       let url = leaguesList[indexPath.section].strBadge
                       cell.logoImage.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
                   case "favorite":
                    cell.title.text = leagues[indexPath.section].leagueName
                        cell.layer.cornerRadius = 15
                        if leagues[indexPath.section].leagueYoutubeLink == ""{
                        }else{
                            cell.youtubeLink = leagues[indexPath.section].leagueYoutubeLink ?? ""
                        }
                        
                       let url = leagues[indexPath.section].leagueBadge
                       cell.logoImage.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
                   default:
                       cell.title.text = leaguesList[indexPath.section].strLeague
                               cell.layer.cornerRadius = 15
                               if leaguesList[indexPath.section].strYoutube == ""{
                               }else{
                                   cell.youtubeLink = leaguesList[indexPath.section].strYoutube ?? ""
                               }
                               
                              let url = leaguesList[indexPath.section].strBadge
                              cell.logoImage.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)
                   }
            
        

                
            
           return cell
        }
          func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 10
          }
    
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
             if editingStyle == .delete {
                if flag == "favorite"{
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
             
        }
    
    

    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//
//            print("deleting \(todos![indexPath.row].name)")
//
//            viewContext.delete(todos![indexPath.row])
//
//            do {
//                try viewContext.save()
//                todos?.remove(at: indexPath.row)
//            } catch {
//                print("Error deleting todo")
//            }
//
//            DispatchQueue.main.async {
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//
//        }
//    }
    
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            
//            contextView?.delete(moviesForDataBase[indexPath.row])
//            moviesForDataBase.remove(at: indexPath.row)
//            do{
//                try contextView?.save()
//            }catch{
//                print("can not delete")
//            }
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
}
