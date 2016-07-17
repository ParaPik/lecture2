//
//  ViewController.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var accountNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startTaped(sender: AnyObject) {
        /*if let text = accountNameField.text {
            Account.AccountName = text
        } else {
            Account.AccountName = "NoName"
        }*/
        
    performSegueWithIdentifier("showQuizSegue", sender: PerformTextSegue(text: accountNameField.text!))
    }
    
    @IBAction func unwindSegue(segue : UIStoryboardSegue) {
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       let transition = sender as! PerformSegue
        transition.performSegue(viewController: segue.destinationViewController)
    }

}

