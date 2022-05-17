//
//  TeamsTableViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class TeamsTableViewCell: UITableViewCell, TeamsView {

    @IBOutlet weak var collectionView: UICollectionView!
    var teamsPresenter: TeamsVCPresenter!

    static let identifier = "TeamsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        teamsPresenter = TeamsVCPresenter(view: self)
//        teamsPresenter.viewDidLoad()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setLeagueName(leagueName: String) {
        teamsPresenter.getTeamsResult(leagueName: leagueName)
    }
    
}
