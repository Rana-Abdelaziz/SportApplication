//
//  TeamsPresenter.swift
//  SportApplication
//
//  Created by Rana on 5/14/22.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import Foundation
import UIKit

class TeamPresenter : TeamsPresnterProtocol{
  
    func gotoFaceBook(url:String){
        print(url)
        let facebookUrl = NSURL(string: "https://"+url)
                if UIApplication.shared.canOpenURL(facebookUrl! as URL) {
                    UIApplication.shared.openURL(facebookUrl! as URL)
                } else {
                    UIApplication.shared.openURL(NSURL(string: "http://facebook.com/")! as URL)
                }
    }
    func gotoInstgram(url:String){
        print(url)
        let instagramUrl = NSURL(string:"https://"+url+"/")
                        if UIApplication.shared.canOpenURL(instagramUrl! as URL) {
                            UIApplication.shared.openURL(instagramUrl! as URL)
                        } else {
                            UIApplication.shared.openURL(NSURL(string: "https://www.instagram.com/"
                )! as URL)
                        }
    }
    func gotoWebSite(url:String){
        print(url)
        let websiteUrl = NSURL(string: "http://"+url)
            
            if UIApplication.shared.canOpenURL(websiteUrl! as URL) {
                UIApplication.shared.openURL(websiteUrl! as URL)
            } else {
                UIApplication.shared.openURL(NSURL(string: "http://google.com/")! as URL)
            }
        
    }
    func gotoTwiter(url:String){
        print(url)

        let twitterUrl = NSURL(string: "https://"+url)
                if UIApplication.shared.canOpenURL(twitterUrl! as URL) {
                    UIApplication.shared.openURL(twitterUrl! as URL)
                } else {
                    UIApplication.shared.openURL(NSURL(string: "https://twitter.com/")! as URL)
                }
    }
    
}
protocol TeamsPresnterProtocol {
    func gotoFaceBook(url:String)
    func gotoInstgram(url:String)
    func gotoWebSite(url:String)
    func gotoTwiter(url:String)
}
