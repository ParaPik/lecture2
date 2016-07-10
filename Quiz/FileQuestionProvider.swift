//
//  FileQuestionProvider.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import Foundation

class FileQuestionProvider : QuestionProvider {
    
    let questions : [AnyObject]
    var currentIndex = 0
    
    init(fileName : String) {
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")!
        let data = NSData(contentsOfFile: path)!
        
        let json = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        let jsonObject = json as! [String : AnyObject]
        
        questions = jsonObject["questions"] as! [AnyObject]
    }
    
    func retrieveQuestion() -> Question? {
        
        var result : Question?
        
        if currentIndex < questions.count {
            let json = questions[currentIndex] as! [String : AnyObject]
            result = parse(json)
            currentIndex += 1
        }
        
        return result
    }
    
    func parse(json : [String : AnyObject]) -> Question {
        
        let questionText = json["question"] as! String
        let correctAnswer = json["correctAnswer"] as! String
        let image = json["image"] as! String
        let answers = json["answers"] as! [String]
        
        return Question(question: questionText, image: image, answers: answers, answer: correctAnswer)
    }
}