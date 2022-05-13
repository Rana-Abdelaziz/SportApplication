//
//  LeaguesDetailesViewController.swift
//  SportApplication
//
//  Created by Rana on 5/13/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import UIKit
import Kingfisher

class LeaguesDetailesViewController: UIViewController {

    @IBOutlet weak var myImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://www.thesportsdb.com//images//media//league//badge//u09z9l1614341476.png"
        myImage.kf.setImage(with: url as? Resource)
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
