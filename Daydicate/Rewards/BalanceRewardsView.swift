//
//  BalanceRewardsView.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 20/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import UIKit
import CoreData

class BalanceRewardsView: UIView {
    
    let pointsLabel = UILabel()
    let starView = makeSymbolImageView(systemName: "rosette")
    let starBalanceLabel = UILabel()
    
    
    var countAchievements = AchievementsManager.shared.countContext()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func style() {
        pointsLabel.translatesAutoresizingMaskIntoConstraints = false
        pointsLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle).bold()
        pointsLabel.text = String(countAchievements)
        
        starView.translatesAutoresizingMaskIntoConstraints = false
        starView.tintColor = .starYellow
        starView.contentMode = .scaleAspectFit
        
        starBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        starBalanceLabel.font = UIFont.preferredFont(forTextStyle: .footnote)
        starBalanceLabel.textColor = .label
        starBalanceLabel.text = "Archievements"
    }
    
    func layout() {
        addSubview(pointsLabel)
        addSubview(starView)
        addSubview(starBalanceLabel)

        NSLayoutConstraint.activate([
            pointsLabel.topAnchor.constraint(equalTo: topAnchor),
            pointsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            starView.leadingAnchor.constraint(equalTo: pointsLabel.trailingAnchor, constant: -2),
            starView.centerYAnchor.constraint(equalTo: pointsLabel.centerYAnchor, constant: 4),
            starView.heightAnchor.constraint(equalToConstant: 15),
                        
            starBalanceLabel.topAnchor.constraint(equalTo: pointsLabel.bottomAnchor, constant: 0),
            starBalanceLabel.leadingAnchor.constraint(equalTo: pointsLabel.leadingAnchor),
            starBalanceLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            starBalanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
