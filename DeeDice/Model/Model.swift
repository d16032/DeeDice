//
//  Model.swift
//  DeeDice
//
//  Created by d1e6032 on 4/10/24.
//

import Foundation
import AVFoundation

var audioPlayer : AVAudioPlayer!

struct Dicee {

    var diceCombo: String!
    
    func rollDiceLeft() -> Int {                    // gets and returns the random num for the left dice
        let leftDice = Int.random(in: 1...6)
        return leftDice
    }
    
    func rollDiceRight() -> Int {                   // gets and returns the random num for the right dice
        let rightDice = Int.random(in: 1...6)
        return rightDice
    }
    
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
}
