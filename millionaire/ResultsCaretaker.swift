//
//  ResultsCaretaker.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 16.06.2021.
//

import Foundation

class ResultsCaretaker {
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    func saveRecords(records: [Result]) {
        do {
            let data = try encoder.encode(records)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadRecords() -> [Result]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([Result].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
