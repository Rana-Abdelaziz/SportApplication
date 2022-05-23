//
//  HomeViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import CoreData

class HomeViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    var homePresenter: HomeVCPresenter!
    let indicator = UIActivityIndicatorView(style: .medium)
    
    let api: HomeAPIProtocol = HomeAPI()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter = HomeVCPresenter(view: self)
        
        api.getAllSports { (result) in
            switch result {
            case .success(let response):
                let sports = response?.sports
                for sport in sports ?? [] {
                    print("sport name: \(sport.strSport ?? "")")
                }
            case .failure(let error):
                // Show UI Error
                print(error.userInfo[NSLocalizedDescriptionKey] as? String ?? "Unknown Error")
            }
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollectionView()
        homePresenter.viewDidLoad()
    }
    
    func showAlert(_ errorMsg: String){
        let alert : UIAlertController = UIAlertController(title: "Error", message: errorMsg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        present(alert,animated: true,completion: nil)
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
