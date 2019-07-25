//
//  ViewController.swift
//  DeeDice
//
//  Created by diegogabisonia on 7/24/19.
//

import UIKit

class ViewController: UIViewController {
    
    var diceNumberOne: Int = 0
    var diceNumberTwo: Int = 2
    
    @IBOutlet weak var diceImageVideOne: UIImageView!
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDice()
        // Do any additional setup after loading the view.
    }

    @IBAction func rollButton(_ sender: UIButton) {
        updateDice()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice()
    }
    
    func updateDice() {
        diceNumberOne = Int.random(in: 1 ... 5)
        diceNumberTwo = Int.random(in: 1 ... 5)
        
        diceImageVideOne.image = UIImage(named: "dice\(diceNumberOne)")
        diceImageViewTwo.image = UIImage(named: "dice\(diceNumberTwo)")
        //print(diceNumberOne)
    }
    
}

