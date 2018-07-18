//
//  EditPageViewController.swift
//  TheNotebook
//
//  Created by MacStudent on 2018-07-18.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class EditPageViewController: UIViewController {
    
    //SEGUE: data from previous page
    var page:Page!
    var myContext:NSManagedObjectContext!

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("I m on edit page")
        
        //SEGUE: DEBUG NONSENSE
        print("===========")
        print("The other screen sent me")
        print(page.text)
        
        textView.text = page.text!
        ///------CoreData
        // app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        // set the context
        myContext = appDelegate.persistentContainer.viewContext
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
       //get the stuff in the textview
        let y = textView.text!
        
        //update the page object
        self.page.text = y
        
        //make the do/try/catch block
        do{
            try myContext.save()
        }
        catch{
            print("error updateing")
        }
        //save the page!!!!!!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
