//
//  ViewController.swift
//  DeeDice
//
//  Created by diegogabisonia on 7/24/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var audioPlayer : AVAudioPlayer!
    var diceCombo : String = ""
    
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
        
        playSound()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        updateDice()
        playSound()
    }
    
    func updateDice() {
        diceNumberOne = Int.random(in: 1 ... 6)
        diceNumberTwo = Int.random(in: 1 ... 6)
        
        diceImageVideOne.image = UIImage(named: "dice\(diceNumberOne)")
        diceImageViewTwo.image = UIImage(named: "dice\(diceNumberTwo)")
        //print(diceNumberOne)
        
      
    }

    func doPlay() {
        let combinations = Bundle.main.url(forResource: diceCombo, withExtension: "mp3")
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: combinations!)
        }
        catch {
            print(error)
        }
        audioPlayer.play()
    }
    
    func playSound() {
            
        if diceNumberTwo == 1 && diceNumberOne == 1 || diceNumberTwo == 1 && diceNumberOne == 2 || diceNumberTwo == 1 && diceNumberOne == 3 || diceNumberTwo == 1 && diceNumberOne == 4 || diceNumberTwo == 1 && diceNumberOne == 5 || diceNumberTwo == 1 && diceNumberOne == 6 || diceNumberTwo == 2 && diceNumberOne == 2 || diceNumberTwo == 2 && diceNumberOne == 3 || diceNumberTwo == 2 && diceNumberOne == 4 || diceNumberTwo == 2 && diceNumberOne == 5 || diceNumberTwo == 2 && diceNumberOne == 6 || diceNumberTwo == 3 && diceNumberOne == 3 || diceNumberTwo == 3 && diceNumberOne == 4 || diceNumberTwo == 3 && diceNumberOne == 5 || diceNumberTwo == 3 && diceNumberOne == 6 || diceNumberTwo == 4 && diceNumberOne == 4 || diceNumberTwo == 4 && diceNumberOne == 5 || diceNumberTwo == 4 && diceNumberOne == 6 || diceNumberTwo == 5 && diceNumberOne == 5 || diceNumberTwo == 5 && diceNumberOne == 6 || diceNumberTwo == 6 && diceNumberOne == 6{
            
            diceCombo = "comb-\(diceNumberTwo)x\(diceNumberOne)"
            doPlay()
        }
            
        
        else if diceNumberTwo == 2 && diceNumberOne == 1 || diceNumberTwo == 3 && diceNumberOne == 1 || diceNumberTwo == 3 && diceNumberOne == 2 ||  diceNumberTwo == 4 && diceNumberOne == 1 || diceNumberTwo == 4 && diceNumberOne == 2 || diceNumberTwo == 4 && diceNumberOne == 3 || diceNumberTwo == 5 && diceNumberOne == 1 || diceNumberTwo == 5 && diceNumberOne == 2 || diceNumberTwo == 5 && diceNumberOne == 3 || diceNumberTwo == 5 && diceNumberOne == 4 || diceNumberTwo == 6 && diceNumberOne == 1 || diceNumberTwo == 6 && diceNumberOne == 2 || diceNumberTwo == 6 && diceNumberOne == 3 || diceNumberTwo == 6 && diceNumberOne == 4 || diceNumberTwo == 6 && diceNumberOne == 5{
            
            diceCombo = "comb-\(diceNumberOne)x\(diceNumberTwo)"
            doPlay()
            
        }
    
    }
}

