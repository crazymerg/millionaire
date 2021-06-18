//
//  Game.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 09.06.2021.
//

import Foundation


final class Game {
    static let shared = Game()
    
    var results = Array<Result>()
    var session: GameSession?
    
    private let resultsCaretaker = ResultsCaretaker()
    
    private init() {
        results = resultsCaretaker.loadRecords() ?? []
    }
    
    func finishGame(with result: Result) {
        self.results.append(result)
    }
}
