//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    
    var gameSound: SystemSoundID = 0

    
    let triviaModel = TriviaModel()
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAswer: UIButton!
    @IBOutlet weak var secondAswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(triviaModel.trivia.count)
        let questionDictionary = triviaModel.trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary["Question"]
        playAgainButton.hidden = true
        
        //Displays Answer
        if questionDictionary["Option1"] != nil && questionDictionary["Option2"] != nil {
            //Sey answers text
            firstAswer.setTitle(questionDictionary["Option1"], forState: UIControlState.Normal)
            secondAswer.setTitle(questionDictionary["Option2"], forState: UIControlState.Normal)
            thirdAnswer.setTitle(questionDictionary["Option3"], forState: UIControlState.Normal)
            fourthAnswer.setTitle(questionDictionary["Option4"], forState: UIControlState.Normal)
            
            //Show hidden buttons
            thirdAnswer.hidden = false
            fourthAnswer.hidden = false
            
        }else{
            //Set answers text
            firstAswer.setTitle("True", forState: UIControlState.Normal)
            secondAswer.setTitle("False", forState: UIControlState.Normal)
            
            //Hide unnecesary button
            thirdAnswer.hidden = true
            fourthAnswer.hidden = true
        }
    }
    
    func displayScore() {
        // Hide the answer buttons
        firstAswer.hidden = true
        secondAswer.hidden = true
        thirdAnswer.hidden = true
        fourthAnswer.hidden = true
        
        // Display play again button
        playAgainButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = triviaModel.trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict["Answer"]
        
        if (sender.titleLabel?.text == correctAnswer) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
        } else {
            // Continue game
            displayQuestion()
        }
    }
    
    @IBAction func playAgain() {
        // Show the answer buttons
        firstAswer.hidden = false
        secondAswer.hidden = false
        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    

    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        
        // Executes the nextRound method at the dispatch time on the main queue
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameSound", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

