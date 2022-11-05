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
    var numberOfQuestionText: String?
    var currentQuestion: String?
    var currentAnswerA: String?
    var currentAnswerB: String?
    var currentAnswerC: String?
    var currentAnswerD: String?
    var currentAnswerCA: String?
    
    //MARK: - Logic
    
    func getQuestion() {
        currentQuestion = questions[numberOfQuestion].text
        numberOfQuestionText = questions[numberOfQuestion].number
        currentAnswerA = questions[numberOfQuestion].answer[0]
        currentAnswerB = questions[numberOfQuestion].answer[1]
        currentAnswerC = questions[numberOfQuestion].answer[2]
        currentAnswerD = questions[numberOfQuestion].answer[3]
        currentAnswerCA = questions[numberOfQuestion].correctAnswer
        numberOfQuestion += 1
    }
    
    func checkAnswer(_ userAnswer: String) -> Bool {
        let check = userAnswer == currentAnswerCA
        questions[numberOfQuestion].isAnswered = check
        return check
    }
    
 func wonAmount() -> String {
        switch numberOfQuestion {
        case 0...4:
            return "Вы ничего не выиграли 😕"
        case 4...9:
            return "Ваш выигрыш 1 000 рублей!"
        case 9...14:
            return "Ваш выигрыш 32 000 рублей!"
        default:
            return ""
        }
    }
}
