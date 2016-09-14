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
    var correctAnswerSound: SystemSoundID = 1
    var wrongAnswerSound: SystemSoundID = 2
    var gameFinishSound: SystemSoundID = 3

    
    var trivia = TriviaModel().trivia
    
    
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var firstAswer: UIButton!
    @IBOutlet weak var secondAswer: UIButton!
    @IBOutlet weak var thirdAnswer: UIButton!
    @IBOutlet weak var fourthAnswer: UIButton!
    @IBOutlet weak var nextGameStateButton: UIButton!
    @IBOutlet weak var questionResultLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadGameStartSound()
        loadCorrectAswerSound()
        loadWrongAswerSound()
        loadGameFinishSound()
        
        //Make buttons corners rounded
        firstAswer.layer.cornerRadius = 10
        secondAswer.layer.cornerRadius = 10
        thirdAnswer.layer.cornerRadius = 10
        fourthAnswer.layer.cornerRadius = 10
        nextGameStateButton.layer.cornerRadius = 10
        
        // Start game
        playGameStartSound()
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextIntWithUpperBound(trivia.count)
        let questionDictionary = trivia[indexOfSelectedQuestion]
        questionField.text = questionDictionary.question
        nextGameStateButton.hidden = true
        
        //Displays Answer
        if questionDictionary.option1 != nil && questionDictionary.option2 != nil {
            //Sey answers text
            firstAswer.setTitle(questionDictionary.option1, forState: UIControlState.Normal)
            secondAswer.setTitle(questionDictionary.option2, forState: UIControlState.Normal)
            thirdAnswer.setTitle(questionDictionary.option3, forState: UIControlState.Normal)
            fourthAnswer.setTitle(questionDictionary.option4, forState: UIControlState.Normal)
            
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
        nextGameStateButton.hidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        
    }
    
    @IBAction func checkAnswer(sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let selectedQuestionDict = trivia[indexOfSelectedQuestion]
        let correctAnswer = selectedQuestionDict.answer
        
        if (sender.titleLabel?.text == correctAnswer) {
            correctQuestions += 1
            questionResultLabel.text = "Correct!"
            questionResultLabel.textColor = UIColor.greenColor()
            questionResultLabel.hidden = false
            playCorrectAnswerSound()
        } else {
            questionResultLabel.text = "Sorry, that´s not it."
            questionResultLabel.textColor = UIColor.orangeColor()
            questionResultLabel.hidden = false
            playWrongAswerSound()
        }
        
        
        //Display correct answer with colors
        firstAswer.tintColor = UIColor.redColor()
        secondAswer.tintColor = UIColor.redColor()
        thirdAnswer.tintColor = UIColor.redColor()
        fourthAnswer.tintColor = UIColor.redColor()
        
        if firstAswer.titleLabel?.text == correctAnswer {
            firstAswer.tintColor = UIColor.greenColor()
        }else{
            if secondAswer.titleLabel?.text == correctAnswer {
                secondAswer.tintColor = UIColor.greenColor()
            }else{
                if thirdAnswer.titleLabel?.text == correctAnswer {
                    thirdAnswer.tintColor = UIColor.greenColor()
                }else{
                    if fourthAnswer.titleLabel?.text == correctAnswer {
                        fourthAnswer.tintColor = UIColor.greenColor()
                    }
                }
            }
        }
        
        //loadNextRoundWithDelay(seconds: 2)
        nextGameStateButton.hidden = false
    }
    
    func nextRound() {
        if questionsAsked == questionsPerRound {
            // Configure nextButton
            nextGameStateButton.setTitle("Play Again", forState: UIControlState.Normal)
            // Game is over
            displayScore()
            playGameFinishSound()
            // Repopulate questions array & reset game counters
            trivia = TriviaModel().trivia
            questionsAsked = 0
            correctQuestions = 0
            
        } else {
            // Configure nextButton
            if questionsAsked == questionsPerRound - 1 {
                nextGameStateButton.setTitle("Finish Game", forState: UIControlState.Normal)
            }else{
                nextGameStateButton.setTitle("Next Question", forState: UIControlState.Normal)
            }
            // Remove question from array
            trivia.removeAtIndex(indexOfSelectedQuestion)
            // Continue game
            //Display white text in buttons
            firstAswer.tintColor = UIColor.whiteColor()
            secondAswer.tintColor = UIColor.whiteColor()
            thirdAnswer.tintColor = UIColor.whiteColor()
            fourthAnswer.tintColor = UIColor.whiteColor()
            displayQuestion()
        }
    }
    
    @IBAction func nextGameState() {
        // Show the answer buttons
        firstAswer.hidden = false
        secondAswer.hidden = false
        questionResultLabel.hidden = true
   
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
    
    func loadGameFinishSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("GameFinished", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &gameFinishSound)
    }
    
    func playGameFinishSound() {
        AudioServicesPlaySystemSound(gameFinishSound)
    }
    
    func loadCorrectAswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("CorrectAnswer", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &correctAnswerSound)
    }
    
    func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }

    
    func loadWrongAswerSound() {
        let pathToSoundFile = NSBundle.mainBundle().pathForResource("WrongAswer", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL, &wrongAnswerSound)
    }
    
    func playWrongAswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }

    
    
    
    
}

