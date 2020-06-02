//
//  ViewController.swift
//  game1
//
//  Created by yash meshram on 13/05/20.
//  Copyright © 2020 yash meshram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var countries = [String]()
    var score = 0
    var correct = 0
    @IBOutlet var button2: UIButton!
    @IBOutlet var button1: UIButton!
    @IBOutlet var questionTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        assignCountries()
        askQuestion()
        
        
    }
  
    func assignCountries() {
          countries += ["us","uk","estonia","france","germany","ireland","italy", "monaco","nigeria","poland","russia","spain"]
        button2.layer.borderWidth = 1
        button1.layer.borderWidth = 1
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button1.layer.cornerRadius = 50
        button1.layer.masksToBounds = true
        button2.layer.cornerRadius = 50
        button2.layer.masksToBounds = true
          
          
      }
    func askQuestion(action: UIAlertAction! = nil){
        countries.shuffle()
        correct = Int.random(in: 0...1)
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2 .setImage(UIImage(named: countries[1]), for: .normal)
        questionTitle.text = countries[correct].uppercased()
       
    }
    @IBAction func buttontapped(_ sender: UIButton) {
        
        if sender.tag == correct {
            questionTitle.text = "CORRECT"
            score += 1
        }
        else{
            questionTitle.text = "WRONG"
             score -= 1
            if(score <= 0)
            {
                score = 0
            }
        }
        let ac = UIAlertController(title:title, message: "Yours score \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "continue", style: .default, handler: askQuestion))
        self.present(ac,animated: true)
    }
}

