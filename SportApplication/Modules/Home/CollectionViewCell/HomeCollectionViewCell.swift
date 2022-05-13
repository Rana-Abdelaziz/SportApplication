//
//  HomeCollectionViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 13/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportName: UILabel!
    static let identifier = "HomeCollectionViewCell"
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
        }
        
        func displaySportName(strSport: String) {
            print("name: \(strSport)")
            sportName.text = strSport
    //        todoId.text = String(id)
        }
        
        func displaySportImage(strSportThumb: String) {
            print("image: \(strSportThumb)")
    //        todoTitle.text = title
        }
        
        
        
    //    public func configure(with image: UIImage) {
    //        imageView.image = image
    //    }
        
        static func nib() -> UINib {
            return UINib(nibName: identifier, bundle: nil)
        }

}
