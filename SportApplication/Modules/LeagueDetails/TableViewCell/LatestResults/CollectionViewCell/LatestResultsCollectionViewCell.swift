//
//  LatestResultsCollectionViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 17/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class LatestResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var homeTeam: UILabel!
    @IBOutlet weak var awayTeam: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    
    static let identifier = "LatestResultsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    // set home team
    func displayHomeTeam(strHomeTeam: String) {
        homeTeam.text = strHomeTeam
    }
    
    // set away team
    func displayAwayTeam(strAwayTeam: String) {
        awayTeam.text = strAwayTeam
    }
    
    // set score
    func displayScore(intHomeScore: String, intAwayScore: String) {
        score.text = "\(intHomeScore) : \(intAwayScore)"
    }
    
    // set date and time
    func displayDateAndTime(dateEventLocal: String, strTimeLocal: String) {
        dateAndTime.text = "\(dateEventLocal) : \(strTimeLocal)"
    }
}
