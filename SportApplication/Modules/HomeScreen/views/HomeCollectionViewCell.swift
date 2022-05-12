//
//  HomeCollectionViewCell.swift
//  SportApplication
//
//  Created by Abdelrhman Ahmed on 12/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    static let identifier = "HomeCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    public func configure(with image: UIImage) {
        imageView.image = image
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }

}
