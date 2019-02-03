//
//  CreateView.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateQuizzesView: UIView {

    lazy var quizTitleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter question here"
        textField.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        return textField
    }()
    
    lazy var factOne: UITextView = {
        let textView = UITextView()
        textView.text = "Enter fact here"
        return textView
    }()
    
    lazy var factTwo: UITextView = {
        let textView = UITextView()
        textView.text = "Enter fact here"
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        setupQuizzTitleConstraints()
        firstFactConstraints()
        secondFactConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupQuizzTitleConstraints() {
        addSubview(quizTitleTextField)
        quizTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        quizTitleTextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 11).isActive = true
        quizTitleTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        quizTitleTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        
        
    }
    
    func firstFactConstraints() {
        addSubview(factOne)
        factOne.translatesAutoresizingMaskIntoConstraints = false
        factOne.topAnchor.constraint(equalTo: quizTitleTextField.bottomAnchor, constant: 11).isActive = true
        factOne.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        factOne.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        factOne.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
    }
    
    func secondFactConstraint() {
        addSubview(factTwo)
        factTwo.translatesAutoresizingMaskIntoConstraints = false
        factTwo.topAnchor.constraint(equalTo: factOne.bottomAnchor, constant: 11).isActive = true
        factTwo.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 11).isActive = true
        factTwo.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -11).isActive = true
        factTwo.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.35).isActive = true
    }
}
