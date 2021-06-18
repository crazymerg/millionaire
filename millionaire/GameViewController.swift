//
//  GameViewController.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 09.06.2021.
//

import UIKit

protocol GameViewControllerDelegate {
    func handleChosenAnswer(_ answer: String)
}

class GameViewController: UIViewController {
    @IBOutlet weak var question: UILabel?
    
    @IBOutlet weak var A: UIButton?
    @IBOutlet weak var B: UIButton?
    @IBOutlet weak var C: UIButton?
    @IBOutlet weak var D: UIButton?
    
    @IBAction func pressA(_ sender: Any) {
        handleQuestionButton(buttonTitle: "A")
    }
    
    @IBAction func pressB(_ sender: Any) {
        handleQuestionButton(buttonTitle: "B")
    }
    
    @IBAction func pressC(_ sender: Any) {
        handleQuestionButton(buttonTitle: "C")
    }
    
    @IBAction func pressD(_ sender: Any) {
        handleQuestionButton(buttonTitle: "D")
    }
    
    @IBAction func auditoryHelp(_ sender: Any) {
    }
    
    @IBAction func fiftyFifty(_ sender: Any) {
    }
    
    @IBAction func friendsCall(_ sender: Any) {
        let alert = UIAlertController(title: "Ошибка", message: "У вас нет друзей", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    var questions: [Question]? = {
        let data = [
                [
                    "question": "first?",
                    "answers": [
                        "A": "yes",
                        "B": "no",
                        "C": "no idea",
                        "D": "wtf"
                    ],
                    "rightAnswer": "D"
                ],
                [
                    "question": "second?",
                    "answers": [
                        "A": "yes",
                        "B": "no",
                        "C": "no idea",
                        "D": "wtf"
                    ],
                    "rightAnswer": "D"
                ],
                [
                    "question": "third?",
                    "answers": [
                        "A": "yes",
                        "B": "no",
                        "C": "no idea",
                        "D": "wtf"
                    ],
                    "rightAnswer": "D"
                ]
        ]
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: data)
            let questions = try JSONDecoder().decode([Question].self, from: jsonData)
            
            return questions
        } catch let error {
            print(error)
            return nil
        }
    }()
    
    var delegate: GameViewControllerDelegate?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let questions = self.questions else { return }
        let session = GameSession(questions)
        session.delegate = self
        self.delegate = session
        Game.shared.session = session
        self.question?.text = session.currentQuestion?.question
        self.A?.setTitle("A: \(session.currentQuestion?.answers.A ?? "")", for: .normal)
        self.B?.setTitle("B: \(session.currentQuestion?.answers.B ?? "")", for: .normal)
        self.C?.setTitle("C: \(session.currentQuestion?.answers.C ?? "")", for: .normal)
        self.D?.setTitle("D: \(session.currentQuestion?.answers.D ?? "")", for: .normal)
    }
    
    func handleQuestionButton(buttonTitle: String) {
        self.delegate?.handleChosenAnswer(buttonTitle)
    }
}


extension GameViewController: GameSessionDelegate {
    func updateUI(question: Question) {
        self.question?.text = question.question
        self.A?.setTitle("A: \(question.answers.A)", for: .normal)
        self.B?.setTitle("B: \(question.answers.B)", for: .normal)
        self.C?.setTitle("C: \(question.answers.C)", for: .normal)
        self.D?.setTitle("D: \(question.answers.D)", for: .normal)
    }
    
    func finishGame(with result: Result) {
        self.dismiss(animated: true, completion: {
            Game.shared.finishGame(with: result)
        })
    }
}
