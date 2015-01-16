//
//  ViewController.swift
//  CanUTapMe2
//
//  Created by Jessica Cavazos on 12/12/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import UIKit
import iAd


class ViewController: UIViewController, ADBannerViewDelegate {
    
    @IBOutlet var logo: UIImageView!
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
    
    
    @IBAction func Start(sender: UIButton) {
        self.performSegueWithIdentifier("Start", sender: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Highscores(sender: UIButton) {
    }
    
}


