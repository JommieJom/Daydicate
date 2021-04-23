//
//  StarRewardsView.swift
//  Daydicate
//
//  Created by Bhanut Sriplakich on 22/4/2564 BE.
//  Copyright © 2564 Daydicate Dev. All rights reserved.
//

import UIKit

class StarRewardsView: UIView {
    
    let stackView = UIStackView()
    let label = UILabel()
    
    struct Reward {
        let numberOfPoints: String
        let description: String
    }

    var rewards: [Reward] =
        [Reward(numberOfPoints: "25", description: "Bronze Badget"),
         Reward(numberOfPoints: "50", description: "Silver Badget"),
         Reward(numberOfPoints: "150", description: "Gold Badget"),
         Reward(numberOfPoints: "250", description: "Platinum Badget"),
         Reward(numberOfPoints: "400", description: "Diamond Badget"),
    ]
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension StarRewardsView {
    
    func style() {
        backgroundColor = .tileBlue
        layer.cornerRadius = 10
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 26
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 16, trailing: -16)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.preferredFont(forTextStyle: .title3).bold()
        label.text = "Achievement Rewards"
    }
    
    func layout() {
        stackView.addArrangedSubview(label)
        
        for reward in rewards {
            stackView.addArrangedSubview(StarRewardsRow(numberOfPoints: reward.numberOfPoints, description: reward.description))
        }
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
