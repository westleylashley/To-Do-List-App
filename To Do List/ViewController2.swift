//
//  ViewController2.swift
//  ToDo2
//
//  Created by Westley Lashley on 3/2/17.
//  Copyright © 2017 Westley Lashley. All rights reserved.
//

import UIKit

class ViewControllerTwo: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var selectIndexPath: IndexPath?
    var toDoListItem: ToDoList!
    
    @IBOutlet weak var itemTextFieldTwo: UITextField!
    @IBOutlet weak var tableViewTwo: UITableView!
    @IBOutlet weak var titleName: UILabel!
    
    @IBAction func addButton(_ sender: UIButton) {
        if itemTextFieldTwo.text != "" {
            toDoListItem.items.append(itemTextFieldTwo.text!)
        tableViewTwo.reloadData()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return toDoListItem.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTwo", for: indexPath) as! ToDoListTableViewCellTwo
        cell.toDoItemLabel.text = "\(toDoListItem.items[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            self.toDoListItem.items.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
}
