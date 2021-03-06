//
//  FavoritesPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit


protocol FavoritesView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
    func navigateToLeagueDetails(leagueDetailsViewController: UIViewController, leagueId: String, leagueName: String)
}

protocol FavoritesCellView {
    func displayLeagueName(strSportThumb: String)
    func displayImage(strSportThumb: String)
    func getYoutubeLink(youtubeLink: String)
}

class FavoritesPresenter {
    
    private weak var view: FavoritesView?
    private var favorites = [League]()
    let coreData = CoreDataServices.shared
    
    init(view: FavoritesView) {
        self.view = view
    }
    
    func fetchAllLeagues(){
        print("fav leagues called")
        favorites = coreData.fetchAllLeagues()
        self.view?.fetchingDataSuccess()
    }
    
    func deleteLeagueAtIndex(_ index: Int){
        coreData.deleteLeagueAtIndex(index)
        favorites.remove(at: index)
    }
    
    func getFavLeaguesCount() -> Int {
        print("fav leagues count inside presenter: \(favorites.count)")
        return favorites.count
    }
    
    func configure(cell: FavoritesTableViewCell, for index: Int) {
        let league = favorites[index]
        cell.displayLeagueName(leagueName: league.leagueName ?? "")
        cell.displayLeagueImage(leagueImage: league.leagueBadge ?? "")
        cell.getYoutubeLink(youtubeLink: league.leagueYoutubeLink ?? "")
//        cell.youtubeLink = favorites[indexPath.section].strYoutube ?? ""
    }
    
    func getLeagueIdAtIndex(index: Int) -> String {
        return favorites[index].leagueId ?? ""
    }
    
    func getLeagueNameAtIndex(index: Int) -> String {
        return favorites[index].leagueName ?? ""
    }
    
//    func getLeagueYoutubeUrlAtIndex(index: Int) -> String {
//        return favorites[index].leagueYoutubeLink ?? ""
//    }
    
    func didSelectRow(leagueDetailsViewController: UIViewController, index: Int) {
        let league = favorites[index]
        let leagueId = league.leagueId
        let leagueName = league.leagueName
//        let leagueDetailsViewController = LeagueDetailsViewController(nibName: "LeagueDetailsViewController", bundle: nil)
//        let leagueDetailsViewController = storyboard?.instantiateViewController(withIdentifier: "LeaguesDetailsViewController") as! LeagueDetailsViewController
        view?.navigateToLeagueDetails(leagueDetailsViewController: leagueDetailsViewController, leagueId: leagueId ?? "", leagueName: leagueName ?? "")
        print("selected fav league name: \(leagueName), id: \(leagueId)")
    }
    
}

