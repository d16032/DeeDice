//
//  ViewController.swift
//  DeeDice
//
//  Created by diegogabisonia on 7/24/19.
//

import UIKit

class ViewController: UIViewController {
    
    var diceCombo : String! // define the combo string var
    
    var dicee = Dicee() // init the dice from Dice struct
    var buttonTag: Int?
    var diceImages: [UIImage] = []
    
    @IBOutlet weak var diceImageVideOne: UIImageView! // IB outlet for the left img of dice
    @IBOutlet weak var diceImageViewTwo: UIImageView! // IB outlet for the right img of dice
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var rollButton: UIButton!
    @IBOutlet weak var historyButtonLabel: UIButton!
    @IBOutlet weak var playerTwoLabel: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Make button rounded
        rollButton.layer.cornerRadius = rollButton.frame.height / 2
        historyButtonLabel.layer.cornerRadius = historyButtonLabel.frame.height / 2
        playerTwoLabel.layer.cornerRadius = playerTwoLabel.frame.height / 2
        
        rollButton.layer.borderWidth = 4
        rollButton.layer.borderColor = CGColor(red: 125, green: 48, blue: 48, alpha: 0.5)
        
        // Load the images (for demonstration purposes, use images from the bundle)
        diceImages = dicee.diceImages
        
        // Set the initial image
        diceImageVideOne.image = diceImages[Int.random(in: 0...5)]
        diceImageViewTwo.image = diceImages[Int.random(in: 0...5)]
    }
    
    @IBAction func historyButton(_ sender: UIButton) {
        
        buttonTag = 1
        self.performSegue(withIdentifier: "DiceRow", sender: self)
    }
    
    @IBAction func p2HistoryButton(_ sender: UIButton) {
        buttonTag = 2
        self.performSegue(withIdentifier: "Player2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DiceRow" {
            let destinationVC = segue.destination as! DiceTableViewController
            
            destinationVC.p1Array = dicee.p1History
            destinationVC.buttonTag = buttonTag
        }
        else if
            segue.identifier == "Player2" {
            let destinationVC = segue.destination as! DiceTableViewController
            
            destinationVC.p2Array = dicee.p2History
            destinationVC.buttonTag = buttonTag
        }
    }
    
    @IBAction func rollButton(_ sender: UIButton) {
        rollButton.isEnabled = false
        rollButton.backgroundColor = UIColor.gray
        dicee.shakeDice() // plays the sfx of shaking dice
        
        dicee.imageChangeTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.dicee.updateDice() // rolls the dice after 1 sec of the previous sfx
            self.dicee.stopImageAnimation()
            self.dicee.dicePlayerTurn(label: self.playerLabel)
            self.rollButton.isEnabled = true
            self.rollButton.backgroundColor = UIColor(red: 0.5, green: 0.7, blue: 0.2, alpha: 1)
            
        }
        //rollButton.isEnabled = true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        dicee.shakeDice() // plays the sfx of shaking dice
        
        dicee.imageChangeTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.8) {
            self.dicee.updateDice() // rolls the dice after 1 sec of the previous sfx
            self.dicee.stopImageAnimation()
            self.dicee.dicePlayerTurn(label: self.playerLabel)
        }
    }
    
    // Method to change the image displayed in the UIImageView
    @objc func changeImage() {
        
        // Set the new image
        let randOne = Int.random(in: 0...5)
        let randTwo = Int.random(in: 0...5)
        diceImageVideOne.image = diceImages[randOne]
        diceImageViewTwo.image = diceImages[randTwo]
        dicee.d1 = randOne + 1
        dicee.d2 = randTwo + 1
    }
}

