//
//  AddToDoViewController.swift
//  ToDo-iOS
//
//  Created by Firoz Ansari on 10/10/2020.
//

import UIKit
import CoreData

class AddToDoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var toDoTableViewController: ToDoTableViewController? = nil
    
    var imagePickerController = UIImagePickerController()
    
    @IBOutlet weak var ToDoImage: UIImageView!
    
    @IBOutlet weak var AddTextField: UITextField!
    
    @IBOutlet weak var PriorityLabel: UILabel!
    
    @IBOutlet weak var PrioritySegmentedControl: UISegmentedControl!
    
    
    @IBAction func cameraTapped(_ sender: Any) {
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func organizeTapped(_ sender: Any) {
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func AddTapped(_ sender: Any) {
//        let newToDo = ToDo()
//        newToDo.priority = PrioritySegmentedControl.selectedSegmentIndex
//        if let name = AddTextField.text {
//            newToDo.name = name
//        }
//        toDoTableViewController?.todos.append(newToDo)
//        toDoTableViewController?.tableView.reloadData()
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            let newToDo = ToDoCD(context: context)
            newToDo.priority = Int32(PrioritySegmentedControl.selectedSegmentIndex)
            if let name = AddTextField.text {
                newToDo.name = name
            }
            newToDo.image = ToDoImage.image?.jpegData(compressionQuality: 1.0)
            (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
        }
    
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            ToDoImage.image = image
        }
        imagePickerController.dismiss(animated: true, completion: nil)
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
