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
    
    var quizzes = [UserQuizzModel]() {
        didSet {
            DispatchQueue.main.async {
                self.quizzesView.myQuizzesCollectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(quizzesView)
        self.quizzesView.myQuizzesCollectionView.register(QuizzCell.self, forCellWithReuseIdentifier: "QuizzCell")
        quizzesView.myQuizzesCollectionView.delegate = self
        quizzesView.myQuizzesCollectionView.dataSource = self
        getDataFromDocumentsDirectory()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getDataFromDocumentsDirectory()
    }
    
    func getDataFromDocumentsDirectory() {
        
        self.quizzes = UserQuizzDataManager.getUserQuizzes()
        self.quizzesView.myQuizzesCollectionView.reloadData()
        
    }

    

}

extension QuizzesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = quizzesView.myQuizzesCollectionView.dequeueReusableCell(withReuseIdentifier: "QuizzCell", for: indexPath) as? QuizzCell else { return UICollectionViewCell() }
        cell.backgroundColor = .white
        
        cell.deleteItemButton.tag = indexPath.row
        
        let selectedQuiz = quizzes[indexPath.row]
        
        cell.quizzTopicLabel.text = selectedQuiz.quizTitle
        
        cell.deleteItemButton.addTarget(self, action: #selector(deleteStuff(_:)), for: .touchUpInside)
        
        return cell
    }
    
    @ objc func deleteStuff(_ sender: UIButton) {
        
        let index = sender.tag
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        let delete = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive) { (delete) in
            UserQuizzDataManager.delete(atIndex: index)
            self.getDataFromDocumentsDirectory()
            
            
        }
        
        actionSheet.addAction(delete)
        present(actionSheet, animated: true)
    }
    
    
}

extension QuizzesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //let quizzToSegue = bookInfoForCollectionView[indexPath.row]
        
        guard let cell = collectionView.cellForItem(at: indexPath) as? QuizzCell else {
            print("didSelectItemAt cell nil")
            return
        }
        let detailedVC = QuizzDetailViewController()
      
        navigationController?.pushViewController(detailedVC, animated: true)
        
    }
   
}
