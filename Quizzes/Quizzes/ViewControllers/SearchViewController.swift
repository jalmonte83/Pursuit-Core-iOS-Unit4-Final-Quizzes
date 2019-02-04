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
        
        self.view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
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
        cell.addItemButton.tag = indexPath.row
        cell.addItemButton.addTarget(self, action: #selector(addButtonPressed(_:)), for: .touchUpInside)
        return cell
    }
    
    @objc func addButtonPressed(_ sender: UIButton) {
        
            
            
            
            
            let alert = UIAlertController.init(title: "Quiz saved to \"My Quizzes\" ", message: nil, preferredStyle: .alert)
            let ok = UIAlertAction.init(title: "Ok", style: .default) { (UIAlertAction) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }

        
       
    
    
}
