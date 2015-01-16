//
//  Level1ViewController.swift
//  CanUtapme?
//
//  Created by Jessica Cavazos on 12/5/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import iAd

class Level1ViewController: UIViewController, ADBannerViewDelegate  {
    
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var ViewMessage: UIView!
    @IBOutlet var btnRed: UIButton!
    @IBOutlet var adBannerView: ADBannerView!
    
    
    var timerRunning = false
    var timer = NSTimer()
    var timerCount = 20
    var newButtonX: CGFloat?
    var newButtonY: CGFloat?
    var score = 0
    var beepSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Beep", ofType: "mp3")!)
    var bkgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimePassing", ofType: "mp3")!)
    var BeepPlayer = AVAudioPlayer()
    var Player = AVAudioPlayer()
    var counter = 1
    
    
    func playMySound(){
        BeepPlayer = AVAudioPlayer(contentsOfURL: beepSound, error: nil)
        BeepPlayer.prepareToPlay()
        BeepPlayer.play()
    }
    
    func playMusic(){
        Player = AVAudioPlayer(contentsOfURL: bkgMusic, error: nil)
        Player.prepareToPlay()
        Player.play()
    }
    
    func Counting (){
        timerCount -= 1
        lblTime.text = "\(timerCount)"
        if (timerCount==0){
            self.performSegueWithIdentifier("Score", sender: self)
        }
    }
    
    
    
    @IBAction func btnbRed(sender: UIButton) {
        // Play Sound
        playMySound()
        
        //Adding Score
        score += 1
        lblScore.text = "\(score)"
        
        //Changing the position of the button
        // Find the button's width and height
        let buttonWidth = btnRed.frame.width
        let buttonHeight = btnRed.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = btnRed.superview!.bounds.width
        let viewHeight = btnRed.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight))) + 40
        
        // Offset the button's center by the random offsets.
        newButtonX = xoffset + buttonWidth / 2
        newButtonY = yoffset + buttonHeight / 2
        btnRed.center.x = xoffset + buttonWidth / 2
        btnRed.center.y = yoffset + buttonHeight / 2
    }
    
    @IBAction func btnPlay(sender: AnyObject) {
        ViewMessage.hidden = true
        if timerRunning == false
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("Counting"), userInfo: nil, repeats: true)
        }
        while (counter<=20){
            playMusic()
            counter += 1
        }
        btnRed.hidden = false

    }
    override func viewDidLayoutSubviews() {
        if let buttonX = newButtonX {
            btnRed.center.x = buttonX
        }
        if let buttonY = newButtonY {
            btnRed.center.y = buttonY
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Score") {
            let destViewController = segue.destinationViewController as ScoreViewController;
            destViewController.score = score
            destViewController.Levelplayed = 1
        }
    }
    
    //Ad Banner
    
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
    //End Ad Banner
}
