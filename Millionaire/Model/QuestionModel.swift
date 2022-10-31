//
//  QuestionModel.swift
//  Millionaire
//
//  Created by Valery Keplin on 31.10.22.
//

import Foundation

struct Question {
    let text: String
    var answer: [String]
    var correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answer = a
        correctAnswer = ca
    }
    
    static let easyQuestions = [
        Question(q: "1", a: ["1","2","3","4"], ca: ""),
        Question(q: "2", a: ["1","2","3","4"], ca: ""),
        Question(q: "3", a: ["1","2","3","4"], ca: ""),
        Question(q: "4", a: ["1","2","3","4"], ca: ""),
        Question(q: "5", a: ["1","2","3","4"], ca: "")
    ]
    
    static let mediumQuestions = [
        Question(q: "1", a: ["1","2","3","4"], ca: ""),
        Question(q: "2", a: ["1","2","3","4"], ca: ""),
        Question(q: "3", a: ["1","2","3","4"], ca: ""),
        Question(q: "4", a: ["1","2","3","4"], ca: ""),
        Question(q: "5", a: ["1","2","3","4"], ca: "")
    ]
    
    static let hardQuestions = [
        Question(q: "1", a: ["1","2","3","4"], ca: ""),
        Question(q: "2", a: ["1","2","3","4"], ca: ""),
        Question(q: "3", a: ["1","2","3","4"], ca: ""),
        Question(q: "4", a: ["1","2","3","4"], ca: ""),
        Question(q: "5", a: ["1","2","3","4"], ca: "")
    ]
}
