//
//  QuizzDetailViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class QuizzDetailViewController: UIViewController {

    let quizzDetailView = QuizzDetailView()
    
    var quizSentFromMain: UserQuizzModel?
    var arrayOfFacts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.view.backgroundColor = .white
        self.view.addSubview(quizzDetailView)
        self.quizzDetailView.quizzDetailCollectionView.dataSource = self
        self.quizzDetailView.quizzDetailCollectionView.delegate = self
        self.quizzDetailView.quizzDetailCollectionView.register(QuizzesDetailCell.self, forCellWithReuseIdentifier: "QuizzesDetailCell")
        
        if let array = quizSentFromMain?.facts{
        arrayOfFacts = array
        }
    }
    

}

extension QuizzDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfFacts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizzDetailView.quizzDetailCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizzesDetailCell", for: indexPath) as? QuizzesDetailCell else { return UICollectionViewCell() }
        cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        cell.quizzDetails.text = quizSentFromMain?.quizTitle
        return cell
    }
}

extension QuizzDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = quizzDetailView.quizzDetailCollectionView.cellForItem(at: indexPath) as? QuizzesDetailCell else { return }
        
        if cell.quizzDetails.text == self.quizSentFromMain?.quizTitle{
            UIView.transition(with: cell, duration: 1.0, options: .transitionFlipFromLeft, animations: {
                cell.quizzDetails.text = self.arrayOfFacts[indexPath.row]
            })
        } else {
            
            UIView.transition(with: cell, duration: 1.0, options: [.transitionFlipFromLeft], animations: {
                cell.quizzDetails.text = self.quizSentFromMain?.quizTitle
            })
        
        }
        
        

        
    }
}
