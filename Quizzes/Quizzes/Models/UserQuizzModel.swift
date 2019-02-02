//
//  UserQuizzModel.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/2/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

struct UserQuizzModel: Codable {
    let id: String
    let quizTitle: String
    let facts: [String]
}
