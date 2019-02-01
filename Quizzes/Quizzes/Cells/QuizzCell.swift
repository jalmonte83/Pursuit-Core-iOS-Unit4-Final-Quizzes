//
//  QuizCell.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzCell: UICollectionViewCell {
    lazy var quizzTopicTextView: UITextView = {
        let tv = UITextView()
        tv.text = "Topic goes here"
        tv.textAlignment = .center
        tv.isEditable = false
        tv.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setupQuizzTopic()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupQuizzTopic() {
        addSubview(quizzTopicTextView)
        quizzTopicTextView.translatesAutoresizingMaskIntoConstraints = false
        quizzTopicTextView.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor).isActive = true
        quizzTopicTextView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
    }
}
