//
//  GameBrain.swift
//  Millionaire
//
//  Created by Valery Keplin on 4.11.22.
//

import Foundation

class GameBrain {
    
    //MARK: - Properties
    var questions = Question.questions
    var numberOfQuestion = 0
    var currentQuestion: String?
    var currentAnswerA: String?
    var currentAnswerB: String?
    var currentAnswerC: String?
    var currentAnswerD: String?
    var currentAnswerCA: String?
    
    //MARK: - Logic
    func getQuestion() {
        currentQuestion = questions[numberOfQuestion].text
        currentAnswerA = questions[numberOfQuestion].answer[0]
        currentAnswerB = questions[numberOfQuestion].answer[1]
        currentAnswerC = questions[numberOfQuestion].answer[2]
        currentAnswerD = questions[numberOfQuestion].answer[3]
        currentAnswerCA = questions[numberOfQuestion].correctAnswer
        numberOfQuestion += 1
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        let check = userAnswer == currentQuestion
        questions[numberOfQuestion].isAnswered = check
        return check
    }
}
