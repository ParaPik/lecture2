//
//  QuizTableViewCell.swift
//  Quiz
//
//  Created by Admin on 17.07.16.
//  Copyright © 2016 Specialist. All rights reserved.
//

import UIKit

class QuizTableViewCell: UITableViewCell {

    @IBOutlet weak var quizAnswer: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
