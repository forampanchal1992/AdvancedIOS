//
//  PagesViewController.swift
//  TheNotebook
//
//  Created by MacStudent on 2018-07-17.
//  Copyright © 2018 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class PagesViewController: UITableViewController {

    // create a data source
    var pages:[Page] = []
   // var pages = ["page1", "page2"]
    //create context variable
    var mycontext: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //app delegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else{return}
        //set the context
        mycontext = appDelegate.persistentContainer.viewContext
        
        //=============
        
        // ---------get name of notebook
        let x = "swift"    // get notebook name from UI
    
        // ----------query database
        //   a) make a fetch request on Page object
        let fetchRequest:NSFetchRequest<Page> = Page.fetchRequest()
        
        //   b) add a predicate
        let n = getNotebook(name:x)
        fetchRequest.predicate = NSPredicate(format:"notebook = %@", n!)
        
        //   c) send query to database & get results
        do  {
            pages = try mycontext.fetch(fetchRequest)
            
            // -----------output to terminal
            for row in pages {
                print(row.text!)
                print(row.dateAdded!)
                print("------")
            }
        }
        catch {
            print("Error while getting all pages from database")
        }
        
        
        
        
        ////==========
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Database helper section
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
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pages.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellB", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = pages[indexPath.row].text
        
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
