//
//  ViewController.swift
//  UserDefaultApp
//
//  Created by MacStudent on 2018-07-09.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // play with user data
        
        //1. tell ios you want to use UserDefaults(localstorage from web)
        
        let defaults = UserDefaults.standard
        
        
        //2. add something to the userDefaults
        
        //string
        defaults.set("Priteshkumar PAtel", forKey: "person");
        
        //boolean
        defaults.set(true, forKey: "isInsrtuctor");
        
        //double
        defaults.set(500.23, forKey: "hourlyRate");
        
        //array
        let courseTaught = ["ios 101", "android 101", "swift 303", "java 101", "databases"]
        defaults.set(courseTaught, forKey: "courses")
        
        //dictionary
        let student = ["name":"Foram PAnchal", "id":"C0908899", "Program":"MADT", "sem":"Third"]
        defaults.set(student, forKey: "student")
        
        //3. print some data form UserDefualts
        
        //print everything
        
       print(defaults.dictionaryRepresentation())
        print("============")
        
        //print specific thing from the dictonary
        let x = defaults.double(forKey: "hourlyRate")
        print(x)
        
        print("Is Pritesh Instructor")
        print(defaults.bool(forKey: "isInsrtuctor"))
        
        //get  dictoanry out
        print("Who is his student?")
        let name = defaults.dictionary(forKey: "student") as! Dictionary<String,String>
        print(name)
        
        //get an array out
        print("What courses does he teach?")
        let c = defaults.array(forKey: "courses") as! [String]
        print(c)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

