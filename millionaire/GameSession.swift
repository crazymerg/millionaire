//
//  GameSession.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 09.06.2021.
//

import Foundation

protocol GameSessionDelegate {
    func updateUI(question: Question)
    func finishGame(with result: Result)
}

class GameSession {
    var questions: [Question]
    var currentQuestion: Question?
    var hasAuditoryHelp = true
    var hasFriendHelp = true
    var hasFiftyFiftyHelp = true
    var rightAnswers = 0
    var delegate: GameSessionDelegate?
    
    init(_ questions: [Question]) {
        self.questions = questions
        self.currentQuestion = nextQuestion()
    }
    
    func nextQuestion() -> Question? {
        if self.questions.count > 0 {
            let question = self.questions.removeFirst()
            
            return question
        } else {
            return nil
        }
    }
}

extension GameSession: GameViewControllerDelegate {
    func handleChosenAnswer(_ answer: String) {
        if answer == self.currentQuestion?.rightAnswer {
            self.rightAnswers += 1
            let nextQuestion = nextQuestion()
            if nextQuestion != nil {
                self.delegate?.updateUI(question: nextQuestion!)
            } else {
                let result = Result(score: Int(self.rightAnswers))
                self.delegate?.finishGame(with: result)
            }
        } else {
            let result = Result(score: Int(self.rightAnswers))
            self.delegate?.finishGame(with: result)
        }
    }
}
