//
//  ExampleTableViewController.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/8.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ExampleTableViewController: UITableViewController {
    
    var imageExamples: [ExampleImageLinks]!
    var indexPath: IndexPath?
    
    let ExampleURL = "https://www.dropbox.com/s/1nlv8zanhmojyq2/ExampleImageLinks_Trial.json?dl=1"
    

    override func viewDidLoad() {

        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        guard let url = URL(string: ExampleURL) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do
            {
                self.imageExamples = try JSONDecoder().decode([ExampleImageLinks].self, from: data)
                
                //Because I got "UITableView.reloadData() must be used from main thread only" when I tied to use self.tableView.reloadData() so I searched online and found this:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //refernce: https://stackoverflow.com/questions/26277371/swift-uitableview-reloaddata-in-a-closure
            }
                
            catch
            {
                print(error.localizedDescription)
            }
            
            }.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (imageExamples ?? []).count
    }
    
    //START HERE
    
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "lineExample(prototypeCell)", for: indexPath)
     
     
     cell.textLabel?.text = imageExamples[indexPath.row].title ?? "Bleh"
     // Configure the cell...
     
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let destination = segue.destination as? ExampleViewController else { return }
        guard let indexPath = self.tableView.indexPathForSelectedRow else { return }
        
        destination.exampleLink = imageExamples[indexPath.row].contents
        //sends the imageExamples object's contents from the imageExamples array fetched from the internet.
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
}
