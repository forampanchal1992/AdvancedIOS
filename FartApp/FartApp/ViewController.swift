//
//  ViewController.swift
//  FartApp
//
//  Created by MacStudent on 2018-07-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    //variables and outlets
    
    //create a sound player variable
    var audioPlayer : AVAudioPlayer?
    
    //default functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   //actions
    @IBAction func playFart(_ sender: UIButton) {
        print("Wet Fart Pressed");
        
        //1. tell system where to find the sound file
        let url = Bundle.main.url(forResource: "fart-03", withExtension: "mp3")
        
        do{
            //code in here will throw errors
            //2. tell the audio player the location of the file
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            //3. play the sound
            audioPlayer?.play()
        }
        catch{
            print("error while trying to play file")
        }
        
    }
    
    @IBAction func playLentils(_ sender: UIButton) {
        print("Too Many Lentils Pressed")
        //1. tell system where to find the sound file
        let url = Bundle.main.url(forResource: "fart-squeak-01", withExtension: "mp3")
        
        do{
            //code in here will throw errors
            //2. tell the audio player the location of the file
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            //3. play the sound
            audioPlayer?.play()
        }
        catch{
            print("error while trying to play file")
        }
    }
    
    @IBAction func playSqueakyFart(_ sender: UIButton) {
        print("Squeaky Fart Pressed")
        //1. tell system where to find the sound file
        let url = Bundle.main.url(forResource: "fart-06", withExtension: "mp3")
        
        do{
            //code in here will throw errors
            //2. tell the audio player the location of the file
            audioPlayer = try AVAudioPlayer(contentsOf: url!)
            //3. play the sound
            audioPlayer?.play()
        }
        catch{
            print("error while trying to play file")
        }
    }
}

