//
//  ViewController.swift
//  TheNotebook
//
//  Created by MacStudent on 2018-07-16.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    //MARK: Outlets
    
    
    @IBOutlet weak var tbNotebooks: UITextField!
    @IBOutlet weak var tbPage: UITextField!
    
    //create context variable
    var mycontext: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //app dalegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        mycontext = appDelegate.persistentContainer.viewContext
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK -- Action
    @IBAction func addNotebooks(_ sender: UIButton) {
        print("Add NoteBooks")
        
        //VAlidation
        //---check if textbox is empty
        let x = tbNotebooks.text!
        if(x.isEmpty)
        {
            print("Please enter notebook name")
            return
        }
        let notebook = Notebook(context: mycontext)
        notebook.title = tbNotebooks.text!
        notebook.dateAdded = Date()
        do{
            try mycontext.save()
            print("Notebook is saved")
        }
        catch{
            print("Error saving NoteBooks to database")
        }
    }
    
    @IBAction func addPagePressed(_ sender: UIButton) {
        let page = Page(context: mycontext)
        page.text = tbPage.text!
        page.dateAdded = Date()
        
        //get the notebook that you want to add page to
        let x = tbNotebooks.text!   //get notebook
        //VALIDATION
        if(x.isEmpty)
        {
            print("Please give your notebook name")
            return
        }
        //LOGIC
        let n = getNotebook(name:x)
        
        //validation
        //checkout that the notebook exists
        
        if(n == nil)
        {
            print("Notebook does not exist")
            return
        }
        //LOGIC
        page.notebook = n
        do{
                try mycontext.save()
            print("Page saved")
        }
        catch{
            print("Error saving in database")
        }
        //associate page to notebook
        //page.notebook =
    }
    
    
    @IBAction func btnshowpages(_ sender: UIButton) {
        
        // ---------get name of notebook
        let x = tbNotebooks.text!    // get notebook name from UI
        
        // VALIDATION :
        // Check that person put something into the text box
        if (x.isEmpty) {
            print("Please give your notebook a name")
            return
        }
        
        // ----------query database
        //   a) make a fetch request on Page object
        let fetchRequest:NSFetchRequest<Page> = Page.fetchRequest()
        
        //   b) add a predicate
        let n = getNotebook(name:x)
        fetchRequest.predicate = NSPredicate(format:"notebook = %@", n!)
        
        //   c) send query to database & get results
        do  {
            let rows = try mycontext.fetch(fetchRequest)
            
            // -----------output to terminal
            for row in rows {
                print(row.text!)
                print(row.dateAdded!)
                print("------")
            }
        }
        catch {
            print("Error while getting all pages from database")
        }
        
    
    }
    
    
    
    
    
    func getNotebook(name:String) -> Notebook? {
        //1.fetch notebook with particular name from CoreData
        let fetchRequest:NSFetchRequest<Notebook> = Notebook.fetchRequest()
        
        //2. add a where statment to mysql statment
        fetchRequest.predicate = NSPredicate(format: "title = %@", name)
        
        //3. add a LIMIT
        fetchRequest.fetchLimit = 1
        
        //fetchrequest = Select * form Notebook where name = "swift" limit 1
        
        //4. get the result from database

        do{
            let rows = try mycontext.fetch(fetchRequest)
            
            if(rows.count > 0)
            {
                 print(rows[0].title)
                return rows[0]
            }
            else{
                return nil
            }
        }
        catch
        {
            print("Error getting from database")
        }
        
        return nil
    }
    
}

