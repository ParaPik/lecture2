//
//  QuizController.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class QuizController : UIViewController {
    
    @IBOutlet weak var testTable: UITableView!
    
    @IBOutlet weak var testQuestion: UILabel!
    
    @IBOutlet weak var testImage: UIImageView!
    
    var questions : QuestionProvider!
    var currentQuestion : Question!
    var userName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = FileQuestionProvider(fileName: "cinema")
        testTable.dataSource = self
        testTable.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        showNextQuestion()
    }
    
    func showNextQuestion() -> Bool {
        let question = questions.retrieveQuestion()
        
        let result = question != nil
        
        if result {
            currentQuestion = question
            testQuestion.text = currentQuestion.questionText
            
            let image = UIImage(named: currentQuestion.imageName)
            testImage.image = image
            testTable.reloadData()
        }
        
        return result
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let transition = sender as! PerformSegue
        transition.performSegue(viewController: segue.destinationViewController)
    }
}

extension QuizController : ControllerWithText {
    func setControllerText(text: String) {
        userName = text
    }
}

extension QuizController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentQuestion.questionAnswers.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "quizIdentifier"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! QuizTableViewCell
        
        let index = indexPath.row
        cell.quizAnswer.text = currentQuestion.questionAnswers[index]
        
        return cell
        
    }
}

extension QuizController : UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let index = indexPath.row
        let answer = currentQuestion.questionAnswers[index]
        
        let correctAnswer = currentQuestion.correctAnswer
        
        if correctAnswer != answer {
            let dialog = UIAlertController(title: "Information", message: "Not correct answer!", preferredStyle: .Alert)
            let action = UIAlertAction(title: "OK", style: .Default) {
                _ -> Void in
                dialog.dismissViewControllerAnimated(true, completion: nil)
            }
            
            dialog.addAction(action)
            presentViewController(dialog, animated: true, completion: nil)
        } else {
            let shown = showNextQuestion()
            if !shown {
                performSegueWithIdentifier("showResultSegue", sender: PerformTextSegue(text: userName))
            }
        }
    }
    
}
