//
//  Question.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import Foundation

class Question {
    
    let questionText : String
    let imageName : String
    let correctAnswer : String
    let questionAnswers : [String]
    
    init(question : String, image : String, answers : [String], answer : String) {
        questionText = question
        imageName = image
        questionAnswers = answers
        correctAnswer = answer
    }
}