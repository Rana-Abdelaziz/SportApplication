//
//  ViewController.swift
//  SportApplication
//
//  Created by Rana on 5/11/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let network = LeaguesNetworkManager(baseUrl: "https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=Soccer")
        network.getLeagues(completionHandler: { [weak self] todos, error in
            
            print("Completion handler ")
            
            guard let self = self else { return }
            //self.view?.hideIndicator()
            
            if let error = error {
               // self.view?.showError()
                print("error")
            } else {
                guard let todos = todos else { return }
                //self.todos = todos
                print(todos)
                print("Completion handler success \(todos.count)")
               // self.view?.fetchingDataSuccess()
            }
        })
    }


}

