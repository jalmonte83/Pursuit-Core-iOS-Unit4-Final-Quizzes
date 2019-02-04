//
//  QuizzesDetailCell.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesDetailCell: UICollectionViewCell {
    
    

    lazy var quizzDetails: UILabel = {
        let label = UILabel()
        label.text = "Topic goes here"
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()




    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupQuizzDetail()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupQuizzDetail() {
        addSubview(quizzDetails)
        quizzDetails.translatesAutoresizingMaskIntoConstraints = false

        quizzDetails.centerYAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.centerYAnchor, multiplier: 0.5).isActive = true
        quizzDetails.centerXAnchor.constraint(equalToSystemSpacingAfter: safeAreaLayoutGuide.centerXAnchor, multiplier: 1).isActive = true

        quizzDetails.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        quizzDetails.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true

    }
    
}
