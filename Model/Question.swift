//
//  Question.swift
//  QuizApp
//
//  Created by Atul Bansal on 14/10/18.
//  Copyright © 2018 Atul Bansal. All rights reserved.
//

import Foundation
class Question {
    let questionText : String
    let answer : Bool
    
    init(text :String,correctAnswer : Bool ) {
        questionText = text
        answer = correctAnswer
    }
}


