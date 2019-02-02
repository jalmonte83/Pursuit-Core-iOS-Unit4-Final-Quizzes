//
//  APIClient.swift
//  Quizzes
//
//  Created by Jeffrey Almonte on 2/1/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import Foundation

final class APIClient {
    static func getQuiz(completionHandler: @escaping (AppError?, [SearchModel]? ) ->Void) {
        let urlString = "http://5c4d4c0d0de08100147c59b5.mockapi.io/api/v1/quizzes"
        NetworkHelper.shared.performDataTask(endpointURLString: urlString, httpMethod: "GET", httpBody: nil) { (appError, data) in
            if let appError = appError {
                completionHandler(appError, nil)
            } else if let data = data  {
                do {
                    let data = try JSONDecoder().decode([SearchModel].self, from: data)
                    completionHandler(nil, data)
                } catch {
                    completionHandler(AppError.jsonDecodingError(error),nil)
                }
            }
        }
    }
    
}
