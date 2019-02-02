//
//  ProfileView.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class ProfileView: UIView {

    lazy var profileImageButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profile-unfilled"), for: .normal)
        return button
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "userName goes here"
        label.textAlignment = .center
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        addSubview(profileImageButton)
        addSubview(userNameLabel)
        setupProfileButton()
        setupUserNameLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupProfileButton() {
        profileImageButton.translatesAutoresizingMaskIntoConstraints = false
        profileImageButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profileImageButton.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    private func setupUserNameLabel() {
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: profileImageButton.bottomAnchor, constant: 16).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -11).isActive = true
        
    }
}
