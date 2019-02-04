//
//  UserQuizzDataManager.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/3/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class UserQuizzDataManager {
    
    static let filename = "UserQuizzData.plist"
    private static var quizzDataArray = [UserQuizzModel]()
    
    private init() {}
    
    static func saveUserQuizzes() {
        let path =  DataPersistenceManager.filepathToDocumentsDiretory(filename: filename)
        print("I have a path: \(path)")
        
        do {
            let data = try PropertyListEncoder().encode(quizzDataArray)
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    static func getUserQuizzes() -> [UserQuizzModel] {
        let path = DataPersistenceManager.filepathToDocumentsDiretory(filename: filename).path
        
        print("This is the path: \(path)")
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    quizzDataArray = try PropertyListDecoder().decode([UserQuizzModel].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            } else {
                print("getUserQuizz data: is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        quizzDataArray = quizzDataArray.sorted{$0.createdAt.date() > $1.createdAt.date()}
        return quizzDataArray
    }
    
    static func addEntry(quiz: UserQuizzModel) {
        quizzDataArray.append(quiz)
        saveUserQuizzes()
    }
    
    static func delete(atIndex index: Int) {
        quizzDataArray.remove(at: index)
        saveUserQuizzes()
    }
}
