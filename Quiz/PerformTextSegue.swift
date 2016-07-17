//
//  PerformTextSegue.swift
//  Quiz
//
//  Created by Admin on 17.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class PerformTextSegue : PerformSegue {
    
    private let text : String
    
    init(text : String) {
        self.text = text
    }
    
    func performSegue(viewController viewController: UIViewController) {
        
        let proto = viewController as? ControllerWithText
        let controller = proto!
        
        controller.setControllerText(text)
    }
}