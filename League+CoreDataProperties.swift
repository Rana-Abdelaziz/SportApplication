//
//  League+CoreDataProperties.swift
//  
//
//  Created by Abdelrhman Ahmed on 19/05/2022.
//
//

import Foundation
import CoreData


extension League {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<League> {
        return NSFetchRequest<League>(entityName: "League")
    }

    @NSManaged public var leagueId: String?
    @NSManaged public var leagueName: String?
    @NSManaged public var leagueBadge: String?
    @NSManaged public var leagueYoutubeLink: String?

}
