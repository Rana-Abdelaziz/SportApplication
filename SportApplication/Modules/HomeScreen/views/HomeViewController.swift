//
//  HomeViewController.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 12/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = layout
        layout.itemSize = CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width + 20) / 2)
        
        collectionView.register(HomeCollectionViewCell.nib(), forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
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

        // Do any additional setup after loading the view.
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

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("collection cell tapped!")
    }
    
    // data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        cell.configure(with: UIImage(named: "placeholder")!)
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (self.view.bounds.width - 48) / 2, height: (self.view.bounds.width + 20) / 2)
        
//        let width = collectionView.frame.width / 2 - 1
//        return CGSize(width: width, height: width)
        
//        return CGSize.init(width: 120, height: 120)
        
    }
    
}
