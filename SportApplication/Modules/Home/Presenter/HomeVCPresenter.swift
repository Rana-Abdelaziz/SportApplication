//
//  HomeVCPresenter.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation

protocol HomeView: class {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError()
}

protocol HomeCellView {
    func displaySportName(strSport: String)
    func displayImage(strSportThumb: String)
}

class HomeVCPresenter {
    
    private weak var view: HomeView?
    private let interactor = HomeInteractor(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/")
    private var sports = [Sport]()
    
    init(view: HomeView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getSports()
    }
    
    func getSports(){
        view?.showIndicator()
        interactor.getSports(endPoint: "all_sports.php", completionHandler: { [weak self] sports, error in

            print("Completion handler ")

            guard let self = self else { return }
            self.view?.hideIndicator()

            if let error = error {
                self.view?.showError()
            } else {
                guard let sports = sports else { return }
                self.sports = sports.sports
                print("Completion handler success \(self.sports.count)")
                print("git")
                self.view?.fetchingDataSuccess()
            }
        })
    }
    
    func getSportsCount() -> Int {
        return sports.count
    }

    func getSportNameAtIndex(index: Int) -> String {
        return sports[index].strSport ?? ""
    }
    
    func removeSports(){
        sports.removeAll()
    }
    
    func configure(cell: HomeCollectionViewCell, for index: Int) {
        let sport = sports[index]
        cell.displaySportName(strSport: sport.strSport ?? "")
        cell.displaySportImage(strSportThumb: sport.strSportThumb ?? "")
    }
    
}
