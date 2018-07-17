//
//  NotebookViewController.swift
//  TheNotebook
//
//  Created by MacStudent on 2018-07-17.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class NotebookViewController: UITableViewController {

    // create a data source
    var notebooks:[Notebook] = []

    //create context variable
    var mycontext: NSManagedObjectContext!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        //set the context
        mycontext = appDelegate.persistentContainer.viewContext
        
        // ----------query database
        //   a) make a fetch request on Notebook object
        let fetchRequest:NSFetchRequest<Notebook> = Notebook.fetchRequest()
        
        //   c) send query to database & get results
        do  {
            self.notebooks = try mycontext.fetch(fetchRequest)
            
            // -----------output to terminal
            for row in notebooks {
                print(row.title!)
                print(row.dateAdded!)
                print("------")
            }
        }
        catch {
            print("Error while getting all pages from database")
        }
        
        //write code to get all the notebooks from coredata
        
            
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notebooks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)

        // Configure the cell...
        // dont' forget to change "myCell" to whatever you called it in the storyboard
        
        // put some text in each row
        cell.textLabel?.text = notebooks[indexPath.row].title
        
        return cell

    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
