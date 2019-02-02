//
//  QuizzesViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzesViewController: UIViewController {

    let quizzesView = QuizzesView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(quizzesView)
        self.quizzesView.myQuizzesCollectionView.register(QuizzCell.self, forCellWithReuseIdentifier: "QuizzCell")
        quizzesView.myQuizzesCollectionView.delegate = self
        quizzesView.myQuizzesCollectionView.dataSource = self
        
    }
    

    

}

extension QuizzesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizzesView.myQuizzesCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizzCell", for: indexPath) as? QuizzCell else { return UICollectionViewCell() }
        cell.backgroundColor = .white
        return cell
    }
    
    
}

extension QuizzesViewController: UICollectionViewDelegateFlowLayout {
   // func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     //<#code#>
    //}
   
}
