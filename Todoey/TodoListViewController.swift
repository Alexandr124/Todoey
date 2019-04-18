//
//  ViewController.swift
//  Todoey
//
//  Created by Alexandr on 4/16/19.
//  Copyright © 2019 14StreetCrew. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Buy iPhone", "visit Odessa", "buy a flat"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String]{
            itemArray = items
        }
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
         cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    // MARK - TableView Delegate METHODS
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add New Items
    
    
    @IBAction func addButtonPresed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todoey Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what whill hpen when user clicks on Ad Item button
            
            self.itemArray.append(textField.text!)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
      
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Creaate new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}

