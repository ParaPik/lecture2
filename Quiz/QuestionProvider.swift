//
//  QuestionProvider.swift
//  Quiz
//
//  Created by Admin on 10.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import Foundation

protocol QuestionProvider {
    
    func retrieveQuestion() -> Question?
}