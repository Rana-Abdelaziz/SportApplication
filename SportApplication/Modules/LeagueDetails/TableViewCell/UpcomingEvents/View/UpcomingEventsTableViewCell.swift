//
//  UpcomingEventsTableViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class UpcomingEventsTableViewCell: UITableViewCell, UpcomingEventsView {

    @IBOutlet weak var collectionView: UICollectionView!
    var upcomingEventsPresenter: UpcomingEventsPresenter!
    
    static let identifier = "UpcomingEventsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        upcomingEventsPresenter = UpcomingEventsPresenter(view: self)
        
//        upcomingEventsPresenter.viewDidLoad(leagueId: leagueId)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    func setLeagueId(leagueId: String) {
        upcomingEventsPresenter.getUpcomingEvents(leagueId: leagueId)
    }
    
}
