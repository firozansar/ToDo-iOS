//
//  ToDoDetailViewController.swift
//  ToDo-iOS
//
//  Created by Firoz Ansari on 10/10/2020.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    var toDo = ToDo()
    
    @IBOutlet weak var ToDoDetailLabel: UILabel!
    
    
    @IBAction func doneTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(toDo.priority == 1){
            ToDoDetailLabel.text = "❗️" + toDo.name
        } else if(toDo.priority == 2){
            ToDoDetailLabel.text = "‼️" + toDo.name
        } else {
            ToDoDetailLabel.text = toDo.name
        }

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
