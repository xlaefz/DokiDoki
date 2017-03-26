//
//  AnimationViewController.swift
//  DrawingCanvas
//
//  Created by Jason Zheng on 3/25/17.
//  Copyright © 2017 tokoro. All rights reserved.
//


import UIKit
import PaperOnboarding

class AnimationViewController: UIViewController, PaperOnboardingDataSource, PaperOnboardingDelegate {
    
    
    @IBOutlet weak var onboardingView: OnboardingView!
    
    @IBOutlet weak var getStartedButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingView.dataSource = self
        onboardingView.delegate = self
        
        print("reached viewdidload")
    }
    
    
    func onboardingItemsCount() -> Int {
        return 3
    }
    
    func onboardingItemAtIndex(_ index: Int) -> OnboardingItemInfo {
        let backgroundColorOne = UIColor(red: 10/255, green: 186/255, blue: 181/255, alpha: 1)
        let backgroundColorTwo = UIColor(red: 106/255, green: 166/255, blue: 211/255, alpha: 1)
        let backgroundColorThree = UIColor(red: 217/255, green: 72/255, blue: 89/255, alpha: 1)
        
        let titleFont = UIFont(name: "AvenirNext-Bold", size: 24)!
        let descirptionFont = UIFont(name: "AvenirNext-Regular", size: 18)!
        
        return [("Ponyo", "A Great Start For Kids", "Explore drawing beyond the 2D realm with movable art!", "", backgroundColorOne, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("brush", "Draw Your Vision", "The kids can draw their scenes and apply pressure to drawings to move them!", "", backgroundColorTwo, UIColor.white, UIColor.white, titleFont, descirptionFont),
                
                ("notification", "Text To Parents", "The kids can easily send their drawings to parents at the touch of a button!", "", backgroundColorThree, UIColor.white, UIColor.white, titleFont, descirptionFont)][index]
        
        
        
    }
    
    
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        
    }
    
    
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        if index == 1 {
            
            if self.getStartedButton.alpha == 1 {
                UIView.animate(withDuration: 0.2, animations: {
                    self.getStartedButton.alpha = 0
                })
            }
            
        }
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        if index == 2 {
            UIView.animate(withDuration: 0.4, animations: {
                self.getStartedButton.alpha = 1
            })
        }
    }
    
    
    
    @IBAction func gotStarted(_ sender: Any) {
        
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(true, forKey: "onboardingComplete")
        
        userDefaults.synchronize()
        
    }
    
    
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

