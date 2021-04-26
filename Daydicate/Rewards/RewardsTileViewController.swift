//
//  RewardsTileViewController.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 20/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import UIKit
import CoreData

class RewardsTileViewController: UIViewController {
    
    let rewardsTileView = RewardsTileView()
    
    var timer = Timer()
    
    
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        
    }

    @objc func updateCounting() {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scheduledTimerWithTimeInterval()
    
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardsTileView)
        
        //rewardsTileView.balanceRewardsView.pointsLabel.text = "\(myGlobalCount)"
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
