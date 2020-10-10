//
//  ToDoDetailViewController.swift
//  ToDo-iOS
//
//  Created by Firoz Ansari on 10/10/2020.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    var toDoCd = ToDoCD()
    
    @IBOutlet weak var ToDoDetailLabel: UILabel!
    
    
    @IBAction func doneTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = toDoCd.name {
            if(toDoCd.priority == 1){
                ToDoDetailLabel.text = "❗️" + name
            } else if(toDoCd.priority == 2){
                ToDoDetailLabel.text = "‼️" + name
            } else {
                ToDoDetailLabel.text = name
            }
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
