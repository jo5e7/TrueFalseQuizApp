//
//  QuizTypeController.swift
//  TrueFalseQuizApp
//
//  Created by Jose Maestre on 15/09/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import UIKit

class QuizTypeController: UIViewController {
    
    @IBOutlet weak var arithmeticQuestions: UIButton!
    @IBOutlet weak var nonArithmetichQuestions: UIButton!
    
    override func viewDidLoad() {
        arithmeticQuestions.layer.cornerRadius = 10
        nonArithmetichQuestions.layer.cornerRadius = 10
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ArithmeticType" {
            if let destinationVC = segue.destinationViewController as? ViewController{
                destinationVC.trivia = TriviaModel(gameWithArithmeticQuestions: true).trivia
                destinationVC.gameType = true

            }
        }else{
            if segue.identifier == "NonArithmeticType" {
                if let destinationVC = segue.destinationViewController as? ViewController{
                    destinationVC.trivia = TriviaModel(gameWithArithmeticQuestions: false).trivia
                    destinationVC.gameType = false
                    
                }
            }
        }
    }
    
}
