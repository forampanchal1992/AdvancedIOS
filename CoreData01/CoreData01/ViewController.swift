//
//  ViewController.swift
//  CoreData01
//
//  Created by MacStudent on 2018-07-10.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1.create variable that allows you to interact with
        //CoreData database
                //let ud = UserDefaults.standard
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        let managedContext = appDelegate.persistentContainer.viewContext
        
        /*
        try{
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
        }
        catch{
            return(exit)
        }*/
        
        //2. create row in the table
        
        //2a. what table do i want to interact with?
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        
        //2b. make the row in the table
        
        //-----create a new user object
        let user = NSManagedObject(entity: userEntity!, insertInto: managedContext)
        //-----set the properties of the object
        user.setValue("Foram Panchal", forKey: "name")
        user.setValue("foramapple@gmail.com", forKey: "email")
        user.setValue(1, forKey: "kids")
        
        //make date variable
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let date = formatter.date(from: "02-02-1992")
        
        user.setValue(date, forKey: "birthday")
        print(user)
        
        //3.save the row to the table
        do{
            try
                managedContext.save()
       
        }
        catch{
            print("Problem saving to database")
        }
        print("Done saving to database")
        
        
        //4.show the row
        
        //4a.create a select * from user
        let userFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        //4b. run the sql
        do{
           let users = try managedContext.fetch(userFetch)
            print(users)
        }
        catch{
                print("Error while fetching stuff from databse")
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @NSManaged public var birthday: NSDate?
    @NSManaged public var email: String?
    @NSManaged public var kids: Int16
    @NSManaged public var name: String?
}

