//
//  QuizModel.swift
//  Quiz
//
//  Created by Kaulitz Guimarães on 02/08/17.
//  Copyright © 2017 Kaulitz Guimarães. All rights reserved.
//

import Foundation
import UIKit
class Question{
    
    var strQuestion: String! //  receive the question text
    var imgQuestion: UIImage!
    var answers: [Answer]!
    
    //constructor
    
    init (question : String, strImageFileName : String, answers : [Answer]){
        self.strQuestion = question
        self.imgQuestion = UIImage(named: strImageFileName)
        self.answers = answers
    }
    
}
class Answer{
    
    var strAnswer : String! // answer text
    var isCorrect : Bool! // if is correct or not
    
    //constructor
    
    init (answer : String, isCorrect : Bool){
        self.strAnswer = answer
        self.isCorrect = isCorrect
    }
    
}
