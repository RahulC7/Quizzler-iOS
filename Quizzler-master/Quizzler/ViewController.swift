//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer:Bool = false
    var questionNumber:Int = 0
    var score : Int = 0;
    
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = allQuestions.list[0]
        questionLabel.text = firstQuestion.questionText
        
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1{
            pickedAnswer = true
        }
        else{
            pickedAnswer = false
        }
        checkAnswer()
        questionNumber+=1
    }
    
    
    func updateUI() {
      scoreLabel.text = "\(score)"
    }
    

    func nextQuestion() {
        if(questionNumber<12){
        questionLabel.text = allQuestions.list[questionNumber].questionText]
             updateUI()
    }
           
        else{
                let alert = UIAlertController(title: "END of Quiz", message: "Done", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
        alert.addAction(restartAction)
        }
    }
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNumber].answer
        if(correctAnswer==pickedAnswer){
            score = score+1;

        }
        else{
            
            
        }
        
        
    }
    
    
    func startOver() {
        questionNumber = 0
        nextQuestion()
    }
    

    
}
