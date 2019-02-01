//
//  TabBarViewController.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()

    }
    
    private func setupTabBar() {
        let quizzesTab = QuizzesViewController()
        quizzesTab.tabBarItem = UITabBarItem(title: "Quizzes", image: UIImage(named: "quiz-icon"), tag: 0)
        quizzesTab.title = "My Quizzes"
        let searchTab = SearchViewController()
        searchTab.tabBarItem = UITabBarItem(title: "Search" , image: UIImage(named: "search-icon"), tag: 1)
        let createTab = CreateViewController()
        createTab.tabBarItem = UITabBarItem(title: "Create", image: UIImage(named: "create-icon"), tag: 2)
        let profileTab = ProfileViewController()
        profileTab.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile-unfilled"), tag: 3)
        let tabBarList = [UINavigationController(rootViewController: quizzesTab),
                          UINavigationController(rootViewController: searchTab),
                          UINavigationController(rootViewController: createTab),
                          UINavigationController(rootViewController: profileTab)
                          ]
        viewControllers = tabBarList
    }
    

}
