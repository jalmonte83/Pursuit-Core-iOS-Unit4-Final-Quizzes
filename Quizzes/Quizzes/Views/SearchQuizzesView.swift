//
//  SearchQuizzesView.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class SearchQuizzesView: UIView {

    lazy var searchQuizzesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 190, height: 250)
        layout.sectionInset = UIEdgeInsets.init(top: 20, left: 10, bottom: 20, right: 10)
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView.init(frame: self.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        return collectionView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        
        addSubview(searchQuizzesCollectionView)
        collectionViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionViewConstraints() {
        searchQuizzesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        searchQuizzesCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        searchQuizzesCollectionView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        searchQuizzesCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive =  true
        
    }
}
