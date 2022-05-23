//
//  CoreDataServices.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 19/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataServices {
    
    static let shared = CoreDataServices()
    var context: NSManagedObjectContext!
    let entity : NSEntityDescription!
    
    init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        entity = NSEntityDescription.entity(forEntityName: "League", in: context)
    }

    func fetchAllLeagues() -> [League] {
        do {
            return try context.fetch(League.fetchRequest())
        } catch {
            print("Error fetching todos")
            return []
        }
    }
    
    func addLeagueToFavorites(leagueId: String, leagueName: String, leagueBadge: String, leagueYoutubeLink: String){
        let league = League(context: context)

        league.leagueId = leagueId
        league.leagueName = leagueName
        league.leagueBadge = leagueBadge
        league.leagueYoutubeLink = leagueYoutubeLink

        do {
            try self.context.save()
            print("league saved with name: \(league.leagueName ?? "")")
        } catch {
            // show ui error
            print("Error adding to favorites")
        }
    }
    
    func checkIfLeagueInFavorites(leagueId: String) -> Bool {
        
        let leagues = fetchAllLeagues()
        
        for league in leagues {
            if league.leagueId == leagueId {
                print("League in favorites coreData \(leagueId)")
                return true
            }
        }
        print("League is not in favorites")
        return false
    }

    func getLeagueById(leagueId: String) -> League? {
        
        var deletedLeague: League?
        
        let leagues = fetchAllLeagues()
        
        for league in leagues {
            if league.leagueId == leagueId {
                deletedLeague = league
            }
        }
        
        return deletedLeague
        
    }
    
    func removeItemFromFavorites(leagueId: String){
        
        let league = getLeagueById(leagueId: leagueId)
        context.delete(league!)
        
        do {
            try context.save()
            print("League removed successfully")
        } catch {
            print("Error deleting league")
        }
    }
    
    func deleteLeagueAtIndex(_ index: Int){
       
        let favorites = fetchAllLeagues()
        
        print("deleting \(favorites[index].leagueName ?? "")")
        
        context.delete(favorites[index])
        
        do {
            try context.save()
        } catch {
            print("Error deleting league")
        }
    }
    
}
