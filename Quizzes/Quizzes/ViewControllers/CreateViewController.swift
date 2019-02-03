//
//  CreateViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    let createView = CreateQuizzesView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .gray
        view.addSubview(createView)
        navigationItem.title = "Create Quizz"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .plain, target: self, action: #selector(createQuizz))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelCreate))
    }
    
    
    
    @objc func createQuizz() {
        
    }
    
    @objc func cancelCreate() {
        dismiss(animated: true) {
 self.resignFirstResponder()
        }
    }
    
}
