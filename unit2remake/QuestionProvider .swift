//
//  QuestionProvider .swift
//  unit2remake
//
//  Created by Darryl Robinson  on 12/19/17.
//  Copyright © 2017 DrobEnterprises. All rights reserved.
//

import Foundation
import GameKit


struct TriviaQuestions {
    var questions : String
    var answers = [String]()
    var correctAnswer = Int()
    
}



    // Using the TriviaQuestions struct the array questionsForUser is created.
    let questionsForUser: [TriviaQuestions] = [ TriviaQuestions(questions: "Which car is the fastest",
                                                               answers: ["Charger","Mustang", "E350", "M4"],
                                                               correctAnswer: 0),
                                                TriviaQuestions(questions: "Which car was made in Europe",
                                                                answers: ["pinto","Challenger", "Mercedes", " Toyota"],
                                                                correctAnswer: 2),
                                                TriviaQuestions(questions: "Which car is the most expensive",
                                                                    answers: ["Explorer","Blazer", "Raptor", "G-Wagon"],
                                                                    correctAnswer: 3),
                                                TriviaQuestions(questions: "Which car has doors that open upward",
                                                                    answers: ["Impala","Eclipse", "corvette", "Lambo"],
                                                                    correctAnswer: 3),
                                                TriviaQuestions(questions: "Which Car has American muscle",
                                                                answers: ["Challenger","Mustang", "Cammaro", "All of the above"],
                                                                correctAnswer: 3),
                                                TriviaQuestions(questions: "Which car is mad for off road obstacles",
                                                                answers: ["corolla","jeep", "taruas", "Lexus"],
                                                                correctAnswer: 1)]
    

    var roundQuestions = [Int]()
    var usedQuestions = [Int]()
    var questionIndex = 0




    func generateQuestion() {
        var i = 0
    while i < questionsForUser.count  {
        roundQuestions.append(i)
        i += 1
        usedQuestions.append(i)
        }
        
    
    
}
//DO NOT UNDERSTAND
func nextQuestion() {
    questionIndex = roundQuestions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: roundQuestions.count))
    usedQuestions.append(questionIndex)
}

