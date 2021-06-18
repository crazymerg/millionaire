//
//  Question.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 08.06.2021.
//

import Foundation

class Question: Codable {
    let question: String
    let answers: Answers
    let rightAnswer: String
}

class Answers: Codable {
    let A: String
    let B: String
    let C: String
    let D: String
}

class Questions: Codable {
    let questions: [Question]
}
