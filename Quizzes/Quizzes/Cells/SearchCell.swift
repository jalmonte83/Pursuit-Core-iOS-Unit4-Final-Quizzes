//
//  SearchCell.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit
protocol AddButtonDelegate: AnyObject {
    
    func addQuizzButton()
    
}

class SearchCell: UICollectionViewCell {
    
    var delegate: AddButtonDelegate?
    
    lazy var searchQuizzTopicLabel: UILabel = {
        let label = UILabel()
        label.text = "Topic goes here"
        label.textAlignment = .center
        label.numberOfLines = 4
        return label
    }()
    
    lazy var addItemButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "add-icon-filled"), for: .normal)
        button.addTarget(self, action: #selector(addQuizButtonPressed), for: .touchUpInside)

        return button
    }()
    
    @objc func addQuizButtonPressed() {
        delegate?.addQuizzButton()
    }

    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setupSearchQuizzTopic()
        setupAddButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSearchQuizzTopic() {
        addSubview(searchQuizzTopicLabel)
        searchQuizzTopicLabel.translatesAutoresizingMaskIntoConstraints = false
        searchQuizzTopicLabel.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        searchQuizzTopicLabel.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        searchQuizzTopicLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor).isActive = true
        searchQuizzTopicLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor).isActive = true 
        
    }
    
    private func setupAddButton() {
        addSubview(addItemButton)
        addItemButton.translatesAutoresizingMaskIntoConstraints = false
        addItemButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        addItemButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
    }
}
