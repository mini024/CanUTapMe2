//
//  Lever3ViewController.swift
//  CanUtapme?
//
//  Created by Jessica Cavazos on 12/5/14.
//  Copyright (c) 2014 JessicaCavazos. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import iAd

class Level3ViewController: UIViewController, ADBannerViewDelegate   {
    
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblScore: UILabel!
    @IBOutlet var ViewMessage: UIView!
    @IBOutlet var btnRed: UIButton!
    @IBOutlet var btnBlue: UIButton!
    @IBOutlet var btnGreen: UIButton!
    @IBOutlet var adBannerView: ADBannerView!
    
    
    var timerRunning = false
    var timer = NSTimer()
    var timerCount = 20
    var newButtonX: CGFloat?
    var newButtonY: CGFloat?
    var newButtonXbl: CGFloat?
    var newButtonYbl: CGFloat?
    var newButtonXgr: CGFloat?
    var newButtonYgr: CGFloat?
    var score = 0
    var beepSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Beep", ofType: "mp3")!)
    var bkgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("TimePassing", ofType: "mp3")!)
    var BeepPlayer = AVAudioPlayer()
    var Player = AVAudioPlayer()
    var counter = 1
    var ErrorPlayer = AVAudioPlayer()
    var Error = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Error", ofType: "mp3")!)
    
    
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
    
    func playMySound2(){
        ErrorPlayer = AVAudioPlayer(contentsOfURL: Error, error: nil)
        ErrorPlayer.prepareToPlay()
        ErrorPlayer.play()
    }
    
    
    func Counting (){
        timerCount -= 1
        lblTime.text = "\(timerCount)"
        if (timerCount==0){
            self.performSegueWithIdentifier("Score", sender: self)
        }
        if (timerCount%2==0){
            //Changing the position of the button Red
            // Find the button's width and height
            let buttonWidth = btnRed.frame.width
            let buttonHeight = btnRed.frame.height
            
            // Find the width and height of the enclosing view
            let viewWidth = btnRed.superview!.bounds.width
            let viewHeight = btnRed.superview!.bounds.height
            
            // Compute width and height of the area to contain the button's center
            let xwidth = viewWidth - buttonWidth
            let yheight = viewHeight - buttonHeight - 80
            
            // Generate a random x and y offset
            let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
            let yoffset = CGFloat(arc4random_uniform(UInt32(yheight))) + 40
            
            // Offset the button's center by the random offsets.
            newButtonX = xoffset + buttonWidth / 2
            newButtonY = yoffset + buttonHeight / 2
            btnRed.center.x = xoffset + buttonWidth / 2
            btnRed.center.y = yoffset + buttonHeight / 2
            
            
            
            //Changing the position of the button Blue
            // Find the button's width and height
            let buttonWidthbl = btnBlue.frame.width
            let buttonHeightbl = btnBlue.frame.height
            
            // Find the width and height of the enclosing view
            let viewWidthbl = btnBlue.superview!.bounds.width
            let viewHeightbl = btnBlue.superview!.bounds.height
            
            // Compute width and height of the area to contain the button's center
            let xwidthbl = viewWidthbl - buttonWidthbl
            let yheightbl = viewHeightbl - buttonHeightbl - 40
            
            // Generate a random x and y offset
            let xoffsetbl = CGFloat(arc4random_uniform(UInt32(xwidthbl)))
            let yoffsetbl = CGFloat(arc4random_uniform(UInt32(yheightbl))) + 40
            
            // Offset the button's center by the random offsets.
            newButtonXbl = xoffsetbl + buttonWidthbl / 2
            newButtonYbl = yoffsetbl + buttonHeightbl / 2
            btnBlue.center.x = xoffsetbl + buttonWidthbl / 2
            btnBlue.center.y = yoffsetbl + buttonHeightbl / 2
            
            
            
            //Changing the position of the button Green
            // Find the button's width and height
            let buttonWidthgr = btnGreen.frame.width
            let buttonHeightgr = btnGreen.frame.height
            
            // Find the width and height of the enclosing view
            let viewWidthgr = btnGreen.superview!.bounds.width
            let viewHeightgr = btnGreen.superview!.bounds.height
            
            // Compute width and height of the area to contain the button's center
            let xwidthgr = viewWidthgr - buttonWidthgr
            let yheightgr = viewHeightgr - buttonHeightgr - 40
            
            // Generate a random x and y offset
            let xoffsetgr = CGFloat(arc4random_uniform(UInt32(xwidthgr)))
            let yoffsetgr = CGFloat(arc4random_uniform(UInt32(yheightgr))) + 40
            
            // Offset the button's center by the random offsets.
            newButtonXgr = xoffsetgr + buttonWidthgr / 2
            newButtonYgr = yoffsetgr + buttonHeightgr / 2
            btnGreen.center.x = xoffsetgr + buttonWidthgr / 2
            btnGreen.center.y = yoffsetgr + buttonHeightgr / 2
        }
    }
    
    @IBAction func btnGreen(sender: UIButton) {
        playMySound2()
        score -= 1
        lblScore.text = "\(score)"
    }
    
    @IBAction func btnBlue(sender: UIButton) {
        playMySound2()
        score -= 1
        lblScore.text = "\(score)"
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
        let yheight = viewHeight - buttonHeight - 40
        
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
        btnGreen.hidden = false
        btnBlue.hidden = false
    }
    override func viewDidLayoutSubviews() {
        if let buttonX = newButtonX {
            btnRed.center.x = buttonX
        }
        if let buttonY = newButtonY {
            btnRed.center.y = buttonY
        }
        if let buttonXbl = newButtonXbl {
            btnBlue.center.x = buttonXbl
        }
        if let buttonYbl = newButtonYbl {
            btnBlue.center.y = buttonYbl
        }
        if let buttonXgr = newButtonXgr {
            btnGreen.center.x = buttonXgr
        }
        if let buttonYgr = newButtonYgr {
            btnGreen.center.y = buttonYgr
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "Score") {
            let destViewController = segue.destinationViewController as ScoreViewController;
            destViewController.score = score
            destViewController.Levelplayed = 3
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
