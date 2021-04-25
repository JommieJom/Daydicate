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
    var updateA: Int?

    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
    }

    @objc func updateCounting(){
        let countA = AchievementsManager.shared.countContext()
        updateA = countA
        print(updateA)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduledTimerWithTimeInterval()
    
        rewardsTileView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(rewardsTileView)
        rewardsTileView.balanceRewardsView.pointsLabel.text = "\(updateA)"
        
        NSLayoutConstraint.activate([
            rewardsTileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            rewardsTileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            rewardsTileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            rewardsTileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
        ])
    }
}
