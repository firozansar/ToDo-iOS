//
//  AddToDoViewController.swift
//  ToDo-iOS
//
//  Created by Firoz Ansari on 10/10/2020.
//

import UIKit

class AddToDoViewController: UIViewController {

    var toDoTableViewController: ToDoTableViewController? = nil
    
    @IBOutlet weak var AddTextField: UITextField!
    
    @IBOutlet weak var PriorityLabel: UILabel!
    
    @IBOutlet weak var PrioritySegmentedControl: UISegmentedControl!
    
    
    @IBAction func AddTapped(_ sender: Any) {
        let newToDo = ToDo()
        newToDo.priority = PrioritySegmentedControl.selectedSegmentIndex
        if let name = AddTextField.text {
            newToDo.name = name
        }
        toDoTableViewController?.todos.append(newToDo)
        toDoTableViewController?.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
