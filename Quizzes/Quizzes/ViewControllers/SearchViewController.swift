//
//  SearchViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    var searchQuizzesView = SearchQuizzesView()
    var searchInfo = [SearchModel]() {
        didSet {
            DispatchQueue.main.async {
                self.searchQuizzesView.searchQuizzesCollectionView.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
        self.view.addSubview(searchQuizzesView)
        navigationItem.title = "Search Quizzes Online"
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
        return searchInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = searchQuizzesView.searchQuizzesCollectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else { return UICollectionViewCell() }
        let cellInfo = searchInfo[indexPath.row]
        cell.backgroundColor = .white
        cell.searchQuizzTopicLabel.text = cellInfo.quizTitle
        //cell.addItemButton.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return cell
    }
    
    
}
