//
//  ViewController.swift
//  DeeDice
//
//  Created by diegogabisonia on 7/24/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer! // import Audio Player lib
    var diceCombo : String! // define the combo string var
    
    var dicee = Dicee() // init the dice from Dice struct
    
    @IBOutlet weak var diceImageVideOne: UIImageView! // IB outlet for the left img of dice
    @IBOutlet weak var diceImageViewTwo: UIImageView! // IB outlet for the right img of dice
    
    override func viewDidLoad() {
        super.viewDidLoad()
        diceImageVideOne.image = UIImage(named: "dice\(1)") // load the first dice with num 1
        diceImageViewTwo.image = UIImage(named: "dice\(1)") // load the second dice with num 1
    
    }

    @IBAction func rollButton(_ sender: UIButton) {
        
        dicee.shakeDice() // plays the sfx of shaking dice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.updateDice() // rolls the dice after 1 sec of the previous sfx
        }
        
    }

    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dicee.shakeDice() // plays the sfx of shaking dice
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.updateDice() // rolls the dice after 1 sec of the previous sfx
        }
    }
    
    func updateDice() {
        let diceNumberOne = dicee.rollDiceLeft() // gets the number of the left dice
        let diceNumberTwo = dicee.rollDiceRight() // gets the number of the right dice
        
        diceImageVideOne.image = UIImage(named: "dice\(diceNumberOne)") // updates the image of the left dice
        diceImageViewTwo.image = UIImage(named: "dice\(diceNumberTwo)") // updates the image of the right dice
        
        dicee.doPlay(combo: "comb-\(diceNumberOne)x\(diceNumberTwo)") // plays the sound of the dice combination
    }
    
}

