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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homePresenter = HomeVCPresenter(view: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupCollectionView()
        homePresenter.viewDidLoad()
    }
    
    func showAlert(){
        
        let alert : UIAlertController = UIAlertController(title: "Error", message: "Something wrong happend while trying to get your data!", preferredStyle: .alert)
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
