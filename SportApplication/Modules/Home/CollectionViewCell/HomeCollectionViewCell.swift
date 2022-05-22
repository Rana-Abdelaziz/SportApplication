//
//  HomeCollectionViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportName: UILabel!
    static let identifier = "HomeCollectionViewCell"
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func displaySportName(strSport: String) {
        sportName.text = strSport
    }
    
    func displaySportImage(strSportThumb: String) {
        sportImage.kf.setImage(with: URL(string: strSportThumb), placeholder: UIImage(named: "placeholder.jpeg"), options: nil, progressBlock: nil, completionHandler: nil)
    }

    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
