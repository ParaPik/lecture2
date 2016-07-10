//
//  FinishController.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class FinishController : UIViewController {
    @IBOutlet weak var finishText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finishText.text = "You did it, " + Account.AccountName + "!"
    }
    
}
