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
    let searchQuizzesView = SearchQuizzesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.view.addSubview(searchQuizzesView)
        self.searchQuizzesView.searchQuizzesCollectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        searchQuizzesView.searchQuizzesCollectionView.dataSource = self
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

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchQuizzesView.searchQuizzesCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        cell.backgroundColor = .white
        return cell
    }
    
    
}
