//
//  QuestionModel.swift
//  TrueFalseQuizApp
//
//  Created by Jose Maestre on 11/09/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


import GameKit

struct TriviaModel{
    
    

    // Simple questions
    let s1 = Question(question: "Only female koalas can whistle", answer: "False", option1: nil, option2: nil, option3: nil, option4: nil)
    let s2 = Question(question: "Blue whales are technically whales", answer: "True", option1: nil, option2: nil, option3: nil, option4: nil)
    let s3 = Question(question: "Camels are cannibalistic", answer: "False", option1: nil, option2: nil, option3: nil, option4: nil)
    let s4 = Question(question: "All ducks are birds", answer: "True", option1: nil, option2: nil, option3: nil, option4: nil)
    
    //Multiple Choice quesitons
    let mc1 = Question(question: "This was the only US President to serve more than two consecutive terms.", answer: "Franklin D. Roosevelt",
                       option1: "George Washington", option2: "Franklin D. Roosevelt", option3: "Woodrow Wilson", option4: "Andrew Jackson")
    let mc2 = Question(question: "Which of the following countries has the most residents?", answer: "Nigeria",
                       option1: "Nigeria", option2: "Russia", option3: "Iran", option4: "Vietnam")
    let mc3 = Question(question: "In what year was the United Nations founded?", answer: "1945",
                       option1: "1918", option2: "1919", option3: "1945", option4: "1954")
    let mc4 = Question(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?", answer: "New York City",
                        option1: "Paris", option2: "Washington D.C.", option3: "New York City", option4: "Boston")
    let mc5 = Question(question: "Which nation produces the most oil?", answer: "Canada",
                       option1: "Iran", option2: "Iraq", option3: "Brazil", option4: "Canada")
    let mc6 = Question(question: "Which country has most recently won consecutive World Cups in Soccer?", answer: "Brazil",
                       option1: "Italy", option2: "Brazil", option3: "Argetina", option4: "Spain")
    let mc7 = Question(question: "Which of the following rivers is longest?", answer: "Mississippi",
                       option1: "Yangtze", option2: "Mississippi", option3: "Congo", option4: "Mekong")
    let mc8 = Question(question: "Which city is the oldest?", answer: "Mexico City",
                       option1: "Mexico City", option2: "Cape Town", option3: "San Juan", option4: "Sydney")
    let mc9 = Question(question: "Which country was the first to allow women to vote in national elections?", answer: "Poland",
                       option1: "Poland", option2: "United States", option3: "Sweden", option4: "Senegal")
    let mc10 = Question(question: "Which of these countries won the most medals in the 2012 Summer Games?", answer: "Great Britian",
                        option1: "France", option2: "Germany", option3: "Japan", option4: "Great Britian")
    
    
    ///////////////////////////////
    

    var trivia :[Question] = []
    
    
    init(gameWithArithmeticQuestions:Bool) {
        
        if gameWithArithmeticQuestions == true {
            for _ in 0...20 {
                let aritfmeticQuestion = createArithmeticQuestions()
                
                trivia.append(aritfmeticQuestion)
            }
            
        }else{
            trivia = [s1, s2, s3, s4, mc1, mc2, mc3, mc4, mc5, mc6, mc7, mc8, mc9, mc10]
        }
        
    }
    

    
}

struct Question {
    
    var question: String
    var answer: String
    var option1: String?
    var option2: String?
    var option3: String?
    var option4: String?
    
}


func createArithmeticQuestions() -> Question {
    
    let a = GKRandomSource.sharedRandom().nextIntWithUpperBound(21)
    let b = GKRandomSource.sharedRandom().nextIntWithUpperBound(21)
    
    let question = "\(a) * \(b)"
    let answer = a * b
    
    var arithmeticQuesiton = Question(question: question, answer: "\(answer)", option1: nil, option2: nil, option3: nil, option4: nil)
    
    arithmeticQuesiton = addRandomAswers(arithmeticQuesiton)
    
    
    //Add correct answer
    let correctAswerPosition = GKRandomSource.sharedRandom().nextIntWithUpperBound(4)
    
    switch correctAswerPosition {
    case 0:
        arithmeticQuesiton.option1 = "\(answer)"
    case 1:
        arithmeticQuesiton.option2 = "\(answer)"
    case 2:
        arithmeticQuesiton.option3 = "\(answer)"
    case 3:
        arithmeticQuesiton.option4 = "\(answer)"
    default:
        arithmeticQuesiton.option3 = "\(answer)"
    }
    
    return arithmeticQuesiton
    
}

func addRandomAswers(question:Question) -> Question {
    
    var returnQuestion = question
    //add 4 answers
    for question in 1...4 {
        
        let answer = "\(GKRandomSource.sharedRandom().nextIntWithUpperBound(401))"
        var answerIsOk = false
        
        // Avoid repeated answers
        while answerIsOk == false {
           
            if (answer != returnQuestion.answer) && (answer != returnQuestion.option1) && (answer != returnQuestion.option2) && (answer != returnQuestion.option3) && (answer != returnQuestion.option4) {
                
                switch question {
                case 1:
                    returnQuestion.option1 = answer
                    answerIsOk = true
                case 2:
                    returnQuestion.option2 = answer
                    answerIsOk = true
                case 3:
                    returnQuestion.option3 = answer
                    answerIsOk = true
                case 4:
                    returnQuestion.option4 = answer
                    answerIsOk = true
                default: break
                    
                }
            }
            
        }
        
    }
    
        return returnQuestion
}


