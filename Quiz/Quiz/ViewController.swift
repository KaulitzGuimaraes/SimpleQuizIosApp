//
//  ViewController.swift
//  Quiz
//
//  Created by Kaulitz Guimarães on 02/08/17.
//  Copyright © 2017 Kaulitz Guimarães. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbQuestion: UILabel! // label that shows the question 
    @IBOutlet weak var imgQuestion: UIImageView!
    @IBOutlet weak var viewFeedback: UIView!
    
    @IBOutlet weak var lblFeedback: UILabel!
   
    //Variables wich get the answers
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    //
    @IBOutlet weak var btnFeedback: UIButton!
    var questions : [Question]!
    
    var question : [Question]! // vector with the questions
    var currentQuestion = 0 //Int that indicates the current question
    var grade = 0.0 // Double to calculate the grade
    var quizEnded = false // Bool that indicates whether the quiz endend or not
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let q0answer0 = Answer( answer: "Gene Simmons", isCorrect: true)
        let q0answer1 = Answer( answer: "David Gilmour", isCorrect: false)
        let q0answer2 = Answer( answer: "Mick Jagger", isCorrect: false)
        let q0answer3 = Answer( answer: "David Paton", isCorrect: false)
        let question0 = Question(question: "Qual o nome do vocalista da banda Kiss?", strImageFileName:"q1" , answers: [q0answer0,q0answer1,q0answer2,q0answer3])
        
        
        let q1answer0 = Answer( answer: "Aerosmith", isCorrect: true)
        let q1answer1 = Answer( answer: "Led Zeppelin", isCorrect: false)
        let q1answer2 = Answer( answer: "Queen", isCorrect: false)
        let q1answer3 = Answer( answer: "Sex Pistols", isCorrect: false)
        let question1 = Question(question: "De quem é a musica 'I don't wanna miss a thing'?", strImageFileName:"q2" , answers: [q1answer0,q1answer1,q1answer2,q1answer3])
        
        let q2answer0 = Answer( answer: "Pilot", isCorrect: true)
        let q2answer1 = Answer( answer: "Nirvana", isCorrect: false)
        let q2answer2 = Answer( answer: "NOFX", isCorrect: false)
        let q2answer3 = Answer( answer: "Ramones", isCorrect: false)
        let question2 = Question(question: "Qual dessas bandas NÃO é considerada punk rock?", strImageFileName:"q3" , answers: [q2answer0,q2answer1,q2answer2,q2answer3])
        
        let q3answer0 = Answer( answer: "Put a gun against his head", isCorrect: true)
        let q3answer1 = Answer( answer: "Pulled my trigger, now he's dead", isCorrect: false)
        let q3answer2 = Answer( answer: "Carry on, carry on", isCorrect: false)
        let q3answer3 = Answer( answer: "Mama!", isCorrect: false)
        let question3 = Question(question: "Complete a lyrics 'Mama, just killed a man ...'", strImageFileName:"q4" , answers: [q3answer0,q3answer1,q3answer2,q3answer3])
        
        let q4answer0 = Answer( answer: "Linkin Park", isCorrect: true)
        let q4answer1 = Answer( answer: "Blink 182", isCorrect: false)
        let q4answer2 = Answer( answer: "All Star", isCorrect: false)
        let q4answer3 = Answer( answer: "Fall Out Boy", isCorrect: false)
        let question4 = Question(question: "De qual banda era o vocalista Chester Bennington (RIP)?'", strImageFileName:"q5" , answers: [q4answer0,q4answer1,q4answer2,q4answer3])
        
        let q5answer0 = Answer( answer: "Guns 'n' Roses", isCorrect: true)
        let q5answer1 = Answer( answer: "AC/DC", isCorrect: false)
        let q5answer2 = Answer( answer: "Pink Floyd", isCorrect: false)
        let q5answer3 = Answer( answer: "Black Sabbath", isCorrect: false)
        let question5 = Question(question: "De quem é a música 'November Rain'?'", strImageFileName:"q6" , answers: [q5answer0,q5answer1,q5answer2,q5answer3])
        questions = [question0,question1,question2,question3,question4,question5]
        
        startQuiz() // starts the Quiz
    }
    
    func startQuiz()  {
       questions.shuffle() // shuffle the quiz questions
        for i in 0 ..< questions.count{
            questions[i].answers.shuffle()
            
        }
         //reset the user progress variables
        quizEnded = false
        grade = 0.0
        currentQuestion = 0
         showQuestion(0) // shows the first question
    }
    
    func showQuestion(_ questionid : Int){
        
        btnAnswer1.isEnabled = true
        btnAnswer2.isEnabled = true
        btnAnswer3.isEnabled = true
        btnAnswer4.isEnabled = true
        lbQuestion.text = questions[questionid].strQuestion
        imgQuestion.image = questions[questionid].imgQuestion
        btnAnswer1.setTitle(questions[questionid].answers[0].strAnswer, for: UIControlState())
        btnAnswer2.setTitle(questions[questionid].answers[1].strAnswer, for: UIControlState())
        btnAnswer3.setTitle(questions[questionid].answers[2].strAnswer, for: UIControlState())
        btnAnswer4.setTitle(questions[questionid].answers[3].strAnswer, for: UIControlState())
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func chooseAnswer1(_ sender: Any) {
        selectAnswer(0)
    }
   
    @IBAction func chooseAnswer2(_ sender: Any) {
         selectAnswer(1)
    }

    @IBAction func chooseAnswer3(_ sender: Any) {
        selectAnswer(2)
    
    }
    @IBAction func chooseAnswer4(_ sender: Any) {
        
          selectAnswer(3)
    }
    
    @IBAction func btnFeedBackAction(_ sender: Any) {
        viewFeedback.isHidden = true //  hiddes 
        
        if (quizEnded){
            startQuiz()
        }else{
            nextQuestion()
        }
    }
    func nextQuestion(){
        currentQuestion = currentQuestion + 1
        if currentQuestion < questions.count{
            showQuestion(currentQuestion)
        } else{
            endQUiz()
        }
        
    }
    func endQUiz(){
        grade = grade/Double(questions.count) * 100.0
        quizEnded = true
        viewFeedback.isHidden = false // shows feedbackviews
        lblFeedback.text = "Sua nota: \(grade)"
        btnFeedback.setTitle("Refazer", for: UIControlState())
    }
    func selectAnswer (_ answerid :  Int){
        
        btnAnswer1.isEnabled = false
        btnAnswer2.isEnabled = false
        btnAnswer3.isEnabled = false
        btnAnswer4.isEnabled = false
       viewFeedback.isHidden = false // shows the feedback
        
        let answer : Answer = questions[currentQuestion].answers[answerid] // select the answer
        
        if answer.isCorrect == true {
            grade = grade + 1
            lblFeedback.text = answer.strAnswer + "\n\nResposta correta!"
        }else{
            lblFeedback.text = answer.strAnswer + "\n\n Resposta errada..."
        }
        if (currentQuestion < questions.count-1){
            // if the current  question isnt the last one, update the button text to next question
            btnFeedback.setTitle("Próxima", for: UIControlState())
        }else {
            // in case the actual question be the last one, update the button text to to see grade
            btnFeedback.setTitle("Ver nota", for: UIControlState())
        }
    }
}

