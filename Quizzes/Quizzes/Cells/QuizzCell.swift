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
        let tv = UILabel()
        tv.text = "Topic goes here"
        tv.textAlignment = .center
        tv.numberOfLines = 4
        return tv
    }()
    
    lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more-filled"), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(quizzTopicLabel)
        addSubview(addItemButton)
        setupQuizzTopic()
        setupAddButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizzTopic() {
        quizzTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        quizzTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        quizzTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
    
    private func setupAddButton() {
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        addItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
}
