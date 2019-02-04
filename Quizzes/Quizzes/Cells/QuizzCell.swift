//
//  QuizCell.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

protocol deleteItemButtonDelegate: AnyObject {
    func moreActionsButtonPressed()
}

class QuizzCell: UICollectionViewCell {
    
    var delegate: deleteItemButtonDelegate?
    
    lazy var quizzTopicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic goes here"
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    lazy var deleteItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "more-filled"), for: .normal)
        button.addTarget(self, action: #selector(deleteItemButtonPressed), for: .touchUpInside)
        return button
    }()
    
    @objc func deleteItemButtonPressed() {
        delegate?.moreActionsButtonPressed()
    }
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setupQuizzTopic()
        setupDeleteButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizzTopic() {
        addSubview(quizzTopicLabel)
        quizzTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        quizzTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        quizzTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        quizzTopicLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        quizzTopicLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
    }
    
    private func setupDeleteButton() {
        addSubview(deleteItemButton)
        deleteItemButton.translatesAutoresizingMaskIntoConstraints = false
        deleteItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        deleteItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
}
