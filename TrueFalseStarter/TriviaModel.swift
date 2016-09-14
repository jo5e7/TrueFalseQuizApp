//
//  QuestionModel.swift
//  TrueFalseQuizApp
//
//  Created by Jose Maestre on 11/09/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//


struct TriviaModel{
    
    struct Question {
        
        var question: String
        var answer: String
        var option1: String?
        var option2: String?
        var option3: String?
        var option4: String?
        
    }


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

    let trivia :[Question]
    
    init() {
        trivia = [s1, s2, s3, s4, mc1, mc2, mc3, mc4, mc5, mc6, mc7, mc8, mc9, mc10]
    }
    
//    let trivia: [[String:String]] = [//Yes or Not questions
//                                    ["Question": "Only female koalas can whistle", "Answer": "False"],
//                                   ["Question": "Blue whales are technically whales", "Answer": "True"],
//                                   ["Question": "Camels are cannibalistic", "Answer": "False"],
//                                   ["Question": "All ducks are birds", "Answer": "True"],
//                                   //Multiple choice questions
//                                    ["Question": "This was the only US President to serve more than two consecutive terms." , "Answer": "Franklin D. Roosevelt", "Option1": "George Washington", "Option2": "Franklin D. Roosevelt", "Option3": "Woodrow Wilson", "Option4": "Andrew Jackson"],
//                                    ["Question": "Which of the following countries has the most residents?" , "Answer": "Nigeria", "Option1": "Nigeria", "Option2": "Russia", "Option3": "Iran", "Option4": "Vietnam"],
//                                    ["Question": "In what year was the United Nations founded?" , "Answer": "1945", "Option1": "1918", "Option2": "1919", "Option3": "1945", "Option4": "1954"],
//                                    ["Question": "The Titanic departed from the United Kingdom, where was it supposed to arrive?" , "Answer": "New York City", "Option1": "Paris", "Option2": "Washington D.C.", "Option3": "New York City", "Option4": "Boston"],
//                                    ["Question": "Which nation produces the most oil?" , "Answer": "Canada", "Option1": "Iran", "Option2": "Iraq", "Option3": "Brazil", "Option4": "Canada"],
//                                    ["Question": "Which country has most recently won consecutive World Cups in Soccer?" , "Answer": "Brazil", "Option1": "Italy", "Option2": "Brazil", "Option3": "Argetina", "Option4": "Spain"],
//                                    ["Question": "Which of the following rivers is longest?" , "Answer": "Mississippi", "Option1": "Yangtze", "Option2": "Mississippi", "Option3": "Congo", "Option4": "Mekong"],
//                                    ["Question": "Which city is the oldest?" , "Answer": "Mexico City", "Option1": "Mexico City", "Option2": "Cape Town", "Option3": "San Juan", "Option4": "Sydney"],
//                                    ["Question": "Which country was the first to allow women to vote in national elections?" , "Answer": "Poland", "Option1": "Poland", "Option2": "United States", "Option3": "Sweden", "Option4": "Senegal"],
//                                    ["Question": "Which of these countries won the most medals in the 2012 Summer Games?" , "Answer": "Great Britian", "Option1": "France", "Option2": "Germany", "Option3": "Japan", "Option4": "Great Britian"]
//    ]
    
}

