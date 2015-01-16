//
//  ScoreViewController.swift
//  CanUtapme?
//
//  Created by Jessica Cavazos on 12/5/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import Foundation
import UIKit
import iAd

class ScoreViewController: UIViewController, ADBannerViewDelegate {
    var score = 0
    var Levelplayed = 0
    var highscore = 0
    @IBOutlet var lblscore: UILabel!
    @IBOutlet var lblhighscore: UILabel!
    @IBOutlet var adBannerView: ADBannerView!
    
    //Ad Banner
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblscore.text = "\(score)"
        highscore = NSUserDefaults.standardUserDefaults().integerForKey("highscore")
        
        //Check if score is higher than NSUserDefaults stored value and change NSUserDefaults stored value if it's true
        if score > NSUserDefaults.standardUserDefaults().integerForKey("highscore") {
            NSUserDefaults.standardUserDefaults().setInteger(score, forKey: "highscore")
            NSUserDefaults.standardUserDefaults().synchronize()
            highscore = score
        }
        NSUserDefaults.standardUserDefaults().integerForKey("highscore")
        lblhighscore.text = "\(highscore)"
        self.canDisplayBannerAds = true
        self.adBannerView.delegate = self
        self.adBannerView.hidden = true //hide until ad loaded
    }
    
    func bannerViewWillLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewWillLoadAd")
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        self.adBannerView.hidden = false //now show banner as ad is loaded
    }
    
    func bannerViewActionDidFinish(banner: ADBannerView!) {
        NSLog("bannerViewDidLoadAd")
        
        //optional resume paused game code
        
    }
    
    func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
        NSLog("bannerViewActionShouldBegin")
        
        //optional pause game code
        
        return true
    }
    
    func bannerView(adBannerView: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        NSLog("bannerView")
        if (adBannerView.hidden == false)
        {
            adBannerView.hidden == true
        }
    }
    //End Ad Banner
    
    //Play Button
    @IBAction func btnPlayagain(sender: UIButton) {
        self.performSegueWithIdentifier("\(Levelplayed)", sender: self)
    }
}
