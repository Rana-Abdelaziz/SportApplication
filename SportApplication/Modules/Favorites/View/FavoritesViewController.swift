//
//  FavoritesViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 20/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController, FavoritesView {

    @IBOutlet weak var tableview: UITableView!
    var favoritesPresenter: FavoritesPresenter!
    
    static let identifier = "FavoritesViewController"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        favoritesPresenter = FavoritesPresenter(view: self)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        favoritesPresenter.fetchAllLeagues()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
