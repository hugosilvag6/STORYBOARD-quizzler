//
//  QuizBrain.swift
//  quizzler
//
//  Created by Hugo Silva on 06/05/22.
//

import Foundation
import UIKit

struct QuizBrain {
    let quiz = [
        Question(q: "A slug's blood is green.", a: "True"),
        Question(q: "Which is the largest organ in the human body?", o: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
        Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
        Question(q: "Five dollars is worth how many nickels?", o: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", o: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
        Question(q: "What is the French word for 'hat'?", o: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", o: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", o: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", o: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
        Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
        Question(q: "Google was originally called 'Backrub'.", a: "True"),
        Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
        Question(q: "What alcoholic drink is made from molasses?", o: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", o: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
        Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
        Question(q: "Where is Tasmania located?", o: ["Indonesia", "Australia", "Scotland"], a: "Australia"),
        Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer (_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText () -> String {
        return quiz[questionNumber].text
    }
    
    func getProcess () -> Float {
        return Float(questionNumber+1)/Float(quiz.count)
    }
    
    mutating func nextQuestion () {
        if questionNumber < quiz.count-1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    func getScore () -> Int {
        return score
    }
    
    func buttonQuant () -> Bool {
        if quiz[questionNumber].options == nil {
            return true
        } else {
            return false
        }
    }
    
    func buttonLabel (_ button: Int) -> String {
        switch button {
        case 1:
            if buttonQuant() {
                return "True"
            } else {
                return (quiz[questionNumber].options?[0])!
            }
        case 2:
            if !buttonQuant() {
                return (quiz[questionNumber].options?[1])!
            } else {
                return ""
            }
        case 3:
            if buttonQuant() {
                return "False"
            } else {
                return (quiz[questionNumber].options?[2])!
            }
        default:
            return "Button error"
        }
    }
}
