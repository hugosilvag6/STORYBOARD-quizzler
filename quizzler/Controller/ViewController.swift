//
//  ViewController.swift
//  quizzler
//
//  Created by Hugo Silva on 05/05/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var optionalButton: UIButton!
    var quizBrain = QuizBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        // checking answers
        let userAnswer = sender.currentTitle!
        let checker = quizBrain.checkAnswer(userAnswer)
        if checker  {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        // moving to next question
        quizBrain.nextQuestion()
        // update label
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
    }
    
    func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProcess()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        optionalButton.isHidden = quizBrain.buttonQuant()
        trueButton.backgroundColor = UIColor.clear
        optionalButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        trueButton.setTitle(quizBrain.buttonLabel(1), for: .normal)
        falseButton.setTitle(quizBrain.buttonLabel(3), for: .normal)
        optionalButton.setTitle(quizBrain.buttonLabel(2), for: .normal)
    }
    
    
}

