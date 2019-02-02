//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchInfo = [SearchModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        getQuizzInfo()
    }
    
    func getQuizzInfo() {
        APIClient.getQuiz { (appError, searchData) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let data = searchData {
                self.searchInfo = data
                dump(data)
            }
        }
    }
    
    
    
}
