//
//  ViewController.swift
//  unit2remake
//
//  Created by Darryl Robinson  on 12/19/17.
//  Copyright © 2017 DrobEnterprises. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
   var randomIndex = [Int]()
    let questionsPerRound = 4
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var gameSound: SystemSoundID = 0

    
    @IBOutlet weak var maintitle: UILabel!
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    @IBOutlet weak var  score: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadGameStartSound()
        // Start game
       // playGameStartSound()
        primetheApp()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func primetheApp() {
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        Button4.isHidden = true
        maintitle.isHidden = false
        questionField.isHidden = true
        playButton.isHidden = false
        score.isHidden = true
        generateQuestion()
        
    }
    
    func displayQuestion() {
        nextQuestion()
        func countQuestions() {
            if questions[questionIndex].answers.count == 3 {
                Button1.isHidden = false ; Button2.isHidden = false; Button3.isHidden = false; Button4.isHidden = true
            }else {
                Button1.isHidden = false ; Button2.isHidden = false; Button3.isHidden = false; Button4.isHidden = false
                Button4.setTitle(questions[questionIndex].answers[3], for: UIControlState.normal)
            }
            
        }
        countQuestions()
        questionField.text = questions[questionIndex].questions
        questionField.isHidden = false
        Button1.setTitle(questions[questionIndex].answers[0], for: UIControlState.normal)
        Button2.setTitle(questions[questionIndex].answers[1], for: UIControlState.normal)
        Button3.setTitle(questions[questionIndex].answers[2], for: UIControlState.normal)
        //Button4.setTitle(questions[questionIndex].answers[3], for: UIControlState.normal)
        playButton.isHidden = true
        score.isHidden = true
        maintitle.isHidden = true

        
        
    }
    

    
    
    
    func displayScore() {
        // Hide the answer buttons
        Button1.isHidden = true
        Button2.isHidden = true
        Button3.isHidden = true
        Button4.isHidden = true
        
        score.isHidden = false
        
        score.text = String(correctQuestions)
        
        // Display play again button
        playButton.isHidden = false
        
        maintitle.isHidden = true
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct! Would you like ot play again?"
        
        
        switch correctQuestions {
        case 0:
            questionField.text = "THATS TERRIBLE"
        case 1:
            questionField.text = " At least you got one question correct"
        case 2:
            questionField.text = " Hey 50cent is half of a dollar."
        case 3:
            questionField.text = " You are have 75% correct"
        case 4:
            questionField.text = " AYYY YOU FYE! You got all of them correct"
        default : break
            
        }
    
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        // Increment the questions asked counter
        questionsAsked += 1
        
        let correctAnswer = questions[questionIndex].correctAnswer
        
        if (sender === Button1 &&  correctAnswer == 0 ) || (sender === Button2 &&  correctAnswer == 1) || (sender === Button3 &&  correctAnswer == 2) || (sender === Button4 &&  correctAnswer == 3) {
            correctQuestions += 1
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        func DisplayCorrectAnswer() {
        switch correctAnswer {
        case 0: Button1.isHidden = false ; Button2.isHidden = true; Button3.isHidden = true; Button4.isHidden = true
        case 1: Button1.isHidden = true ; Button2.isHidden = false; Button3.isHidden = true; Button4.isHidden = true
        case 2: Button1.isHidden = true ; Button2.isHidden = true; Button3.isHidden = false; Button4.isHidden = true
        case 3: Button1.isHidden = true ; Button2.isHidden = true; Button3.isHidden = true; Button4.isHidden = false
        default: Button1.isHidden = false ; Button2.isHidden = false; Button3.isHidden = false; Button4.isHidden = false
        }
        }
        DisplayCorrectAnswer()
        
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
        Button1.isHidden = false
        Button2.isHidden = false
        Button3.isHidden = false
        Button4.isHidden = false

        
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    
    
    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    /*func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    */
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}



