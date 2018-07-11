//
//  ViewController.swift
//  NoteTakingApp
//
//  Created by robin on 2018-07-09.
//  Copyright © 2018 robin. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

        //Global Variables
    @IBOutlet weak var noteText: UITextField!
    
    var groceryList: [GroceryListItem] = []
    
    @IBOutlet weak var textView: UITextView!
    
    var managedContext : NSManagedObjectContext? //making global
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //1. connection to database
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        managedContext = appDelegate.persistentContainer.viewContext
      
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addSampleData() {
        for x in 1...5 {
            
            let randomWords = "This is item \(x)"
            //1. create your objects
            let item:GroceryListItem = GroceryListItem(item: randomWords)

            groceryList.append(item)
        }
    }

    @IBAction func addItem(_ sender: Any) {
        print("clicked!")
        
        // check if textbox is empty
        guard let x = noteText.text , x != "" else {
            print("textbox is empty")
            return
        }
        
        //---------------
        //1.create a new coredata GroceryItem object
        let groceryItemEntity = NSEntityDescription.entity(forEntityName: "GroceryItem", in: managedContext!)
        let item = NSManagedObject(entity: groceryItemEntity!, insertInto: managedContext)
        //2. set the properties of COreData GroceryItem,
        item.setValue(noteText.text!, forKey: "itemName")  //from textbox
        item.setValue(Date(), forKey: "dateAdded")  // Date() -> automatically creates toadya date
        //3. save the object to database
        
        do{
            try managedContext!.save()
        }
        catch{
            print("Erroring saving to database")
        }
        //==================
        
        
        // create a note and save to system --Logic
        //let item : GroceryListItem = GroceryListItem(item:x)
        //groceryList.append(item);
        
        // clear the textbox
        noteText.text = ""
        
        // create an alert box to show user
        
        // -- make an alert
        let alert = UIAlertController(title: "Save Complete", message: "Your item was saved!", preferredStyle: .alert)
        
        // -- add a button
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
        
        // -- show the popup
        self.present(alert, animated: true, completion: nil)
       
        
    }

    @IBAction func showAll(_ sender: Any) {
        //1.make a 'fetch request'
        //--teling ios which table you want     (GroceryItem)
        //--tell ios what sql query you want   (Select * from) by default
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GroceryItem")
        
        //2. send query to database
        do{
          let rows = try managedContext!.fetch(fetchRequest)
            for item in rows {
                let x = item as! GroceryItem
                print("\(x.dateAdded): \(x.itemName)")
            }
        }
        catch{
            print("Error fetching data from database")
        }
        
        
        
    }
}

