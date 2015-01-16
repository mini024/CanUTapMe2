//
//  LevelesViewController.swift
//  CanUtapme?
//
//  Created by Jessica Cavazos on 12/5/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import Foundation
import UIKit
import iAd

class LevelesViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet var adBannerView: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    //... your class implementation code


}