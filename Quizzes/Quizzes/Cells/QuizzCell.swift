//
//  QuizCell.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzCell: UICollectionViewCell {
    
    lazy var quizzTopicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic goes here"
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }()
    
    lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more-filled"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setupQuizzTopic()
        setupAddButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizzTopic() {
        addSubview(quizzTopicLabel)
        quizzTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        quizzTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        quizzTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setupAddButton() {
        addSubview(addItemButton)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        addItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
}
