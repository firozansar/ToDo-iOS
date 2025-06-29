//
//  ToDoTableViewController.swift
//  ToDo-iOS
//
//  Created by Firoz Ansari on 09/10/2020.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var todocd: [ToDoCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let toDosFromCoreData = try? context.fetch(ToDoCD.fetchRequest()){
                if let toDos = toDosFromCoreData as? [ToDoCD]{
                    todocd = toDos
                    tableView.reloadData()
                }
            }
        }
    }



    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todocd.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let selectedTodo = todocd[indexPath.row]
        if let name = selectedTodo.name {
            if(selectedTodo.priority == 1){
                cell.textLabel?.text = "❗️" + name
            } else if(selectedTodo.priority == 2){
                cell.textLabel?.text = "‼️" + name
            } else {
                cell.textLabel?.text = selectedTodo.name
            }
        }
        
        if let data = selectedTodo.image {
            cell.imageView?.image = UIImage(data: data)
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedToDo = todocd[indexPath.row]
        performSegue(withIdentifier: "moveToDetail", sender: selectedToDo)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let addToDoViewController = segue.destination as? AddToDoViewController {
            addToDoViewController.toDoTableViewController = self
        }
        
        if let detailViewController = segue.destination as? ToDoDetailViewController {
            if let selectedToDo = sender as? ToDoCD{
                detailViewController.toDoCd = selectedToDo
            }
        }
    }
}
