//
//  Model.swift
//  DeeDice
//
//  Created by d1e6032 on 4/10/24.
//

import UIKit
import AVFoundation

var audioPlayer : AVAudioPlayer!

struct Dicee {
    
    var diceCombo: String!
    var diceTrhow = 0
    var p1History: [String] = []
    var p2History: [String] = []
    var d1 = 0
    var d2 = 0
    
    // Timer to control the speed of image changes
    var imageChangeTimer: Timer?
    
    // Create an instance of UIImageView to display the images
    var imageView: UIImageView!
    
    // ARRAY OF DICE IMAGES
    var diceImages = [
        UIImage(named: "dice1")!,
        UIImage(named: "dice2")!,
        UIImage(named: "dice3")!,
        UIImage(named: "dice4")!,
        UIImage(named: "dice5")!,
        UIImage(named: "dice6")!
    ]
    
    func rollDiceLeft() -> Int {                    // gets and returns the random num for the left dice
        let leftDice = Int.random(in: 1...6)
        return leftDice
    }
    
    func rollDiceRight() -> Int {                   // gets and returns the random num for the right dice
        let rightDice = Int.random(in: 1...6)
        return rightDice
    }
    
    // AUDIO FOR SHAKING DICE
    func shakeDice() {                              // sft for shaking dice
        let rollDice = Bundle.main.url(forResource: "diceRoll", withExtension: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: rollDice!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    // AUDIO FOR COMBOS
    mutating func doPlay(combo:String) {
        let combinations = Bundle.main.url(forResource: combo, withExtension: "mp3")
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            audioPlayer = try AVAudioPlayer(contentsOf: combinations!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    mutating func dicePlayerTurn(label: UILabel) {
        if diceTrhow == 0 {
            self.diceTrhow += 1
            label.text = "Player 2 turn"
        } else {
            self.diceTrhow -= 1
            label.text = "Player 1 turn"
        }
    }
    
    // UPDADE DICE IMAGES FROM RANDOM NUMBERS
    mutating func updateDice() {
        let diceNumberOne = d1 // gets the number of the left dice
        let diceNumberTwo = d2 // gets the number of the right dice
        //dice1.image = UIImage(named: "dice\(diceNumberOne)") // updates the image of the left dice
        //dice2.image = UIImage(named: "dice\(diceNumberTwo)") // updates the image of the right dice
        if diceTrhow == 0 {
            p1History.append("\(diceNumberOne)x\(diceNumberTwo)")
        } else {
            p2History.append("\(diceNumberOne)x\(diceNumberTwo)")
        }
        print("Player 1: \(p1History)")
        print("Player 2: \(p2History)")
        
        doPlay(combo: "comb-\(diceNumberOne)x\(diceNumberTwo)") // plays the sound of the dice combination
        
    }
    
    mutating func stopImageAnimation() {
        // Invalidate the timer to stop the image animation
        imageChangeTimer?.invalidate()
        self.imageChangeTimer = nil // Clear the reference to the timer
    }
}
