//
//  ViewController.swift
//  SaveVolume
//
//  Created by robin on 2017-11-08.
//  Copyright © 2017 robin. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
 //variables
    @IBOutlet weak var volumen: UISlider!

    @IBOutlet weak var lblVolume: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //get the value from database
        let data = defaults.float(forKey: "volume1")
        //put value in slider
        volumen.value = Float(data)
        //show value on screen
        lblVolume.text = String(data)
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderValueChanged(_ sender: UISlider) {
       //get the value of slider
        let selectedValue = volumen.value
        
        lblVolume.text = String(selectedValue)
        defaults.set(selectedValue, forKey: "volume1")
    }
}

