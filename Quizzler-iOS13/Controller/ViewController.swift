//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!

    @IBOutlet weak var choiceOneBtn: UIButton!
    @IBOutlet weak var choiceTwoBtn: UIButton!
    @IBOutlet weak var choiceThreeBtn: UIButton!
    
    
    
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    @objc func updateUI(){
        
       
        questionLabel.text = quizBrain.getQuestionText()
        
        choiceOneBtn.setTitle(quizBrain.getQuestionAnswer(index: 0), for: .normal)
        choiceTwoBtn.setTitle(quizBrain.getQuestionAnswer(index: 1), for: .normal)
        choiceThreeBtn.setTitle(quizBrain.getQuestionAnswer(index: 2), for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        
        choiceOneBtn.backgroundColor = UIColor.clear
        choiceTwoBtn.backgroundColor = UIColor.clear
        choiceThreeBtn.backgroundColor = UIColor.clear
        
    }
    
}

