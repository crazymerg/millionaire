//
//  Result.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 09.06.2021.
//

import Foundation


class Result: Codable {
    let date: Date
    let score: Int
    
    init(score: Int) {
        self.score = score
        self.date = Date()
    }
}
