//
//  LatestResultsTableViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class LatestResultsTableViewCell: UITableViewCell, LatestResultsView {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var latestResultsPresenter: LatestResultsPresenter!

    static let identifier = "LatestResultsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        latestResultsPresenter = LatestResultsPresenter(view: self)
        latestResultsPresenter.viewDidLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
}
