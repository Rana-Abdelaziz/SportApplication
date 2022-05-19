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
             return leaguesList.count
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
          }
          
          
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
            leagueDetailsViewController.leagueId = leaguesList[indexPath.section].idLeague
            leagueDetailsViewController.leagueName = leaguesList[indexPath.section].strLeague
            leagueDetailsViewController.leagueBadge = leaguesList[indexPath.section].strBadge
            leagueDetailsViewController.leagueYoutubeLink = leaguesList[indexPath.section].strYoutube
            
//            self.present(leagueDetailsViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(leagueDetailsViewController, animated: true)
            
        }
        
          func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesTableViewCell", for: indexPath) as! LeaguesTableViewCell
            
            //check flag at first
            cell.title.text = leaguesList[indexPath.section].strLeague
            cell.layer.cornerRadius = 15

            if leaguesList[indexPath.section].strYoutube == ""{
                
    //            cell.youtubeImage.isUserInteractionEnabled = false
    //            let blur = UIVisualEffectView(effect: UIBlurEffect(style:
    //                        UIBlurEffect.Style.light))
    //            blur.frame = cell.youtubeImage.bounds
    //            blur.isUserInteractionEnabled = false //This allows touches to forward to the button.
    //            cell.youtubeImage.insertSubview(blur, at: 0)

                
            }else{
                cell.youtubeLink = leaguesList[indexPath.section].strYoutube ?? ""
            }
            
           let url = leaguesList[indexPath.section].strBadge
            cell.logoImage.kf.setImage(with: URL(string: url!), placeholder: UIImage(named: "youtube.png"), options: nil, progressBlock: nil, completionHandler: nil)

                
            
           return cell
        }
          func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
              return 10
          }
    
    
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
