//
//  ViewController.swift
//  QuizApp
//
//  Created by Atul Bansal on 13/10/18.
//  Copyright © 2018 Atul Bansal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let allQuestion = QuestionBank()
    var answerePress : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Score:0"
        progressLabel.text = "\(questionNumber+1)/13"
       nextQuestion()
        
    }

    @IBAction func answerePressed(_ sender: Any) {
        if (sender as AnyObject).tag == 1 {
            answerePress = true
        }
        else {
            answerePress = false
        }
        
        checkAnswere()
        questionNumber+=1
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber+1) / 13"
        
        progressBar.frame.size.width = (view.frame.size.width/13) * (CGFloat)(questionNumber+1)
    }
    
    func nextQuestion() {
        if questionNumber < 13 {
        questionLabel.text = allQuestion.list[questionNumber].questionText
           updateUI()
        }
        else {
            let Alert = UIAlertController(title: "Great Work", message: "Quiz has ended.Do you wish to start over", preferredStyle: .alert)
            let restart = UIAlertAction(title: "restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            Alert.addAction(restart)
            present(Alert,animated: true,completion: nil)
        }
        
    }
    
    func checkAnswere() {
        if allQuestion.list[questionNumber].answer == answerePress {
           // print("Correct Answere")
            ProgressHUD.showSuccess("Correct!")
            score += (Int)((0.076)*100)
        }
        else {
            //print("Wrong Answere")
            ProgressHUD.showError("Wrong!")
        }
    }
    
    func startOver() {
        questionNumber = 0
        score = 0
        viewDidLoad()
        
    }
    
}

