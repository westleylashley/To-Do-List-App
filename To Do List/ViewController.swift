//
//  ViewController.swift
//  ToDo2
//
//  Created by Westley Lashley on 3/2/17.
//  Copyright © 2017 Westley Lashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var selectIndexPath: IndexPath?
    var todoList = [ToDoList]()
    
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!

    @IBAction func addButton(_ sender: UIButton) {
        if itemTextField.text != "" {
            let todoListTaco = ToDoList(nameOfList: itemTextField.text!, items: [])
            todoList.append(todoListTaco)
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ToDoListTableViewCell
        let item = todoList[indexPath.row].nameOfLists
        cell.toDoListLabel.text = item
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.todoList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // User selected an index path
        selectIndexPath = indexPath
        let listName = todoList[indexPath.row]
        // Segue to the next view
        performSegue(withIdentifier: "ToDoSeque", sender: listName)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewControllerTwo {
            if let listName = sender as? ToDoList {
                destination.toDoListItem = listName
                
            }
        }
    }
}
