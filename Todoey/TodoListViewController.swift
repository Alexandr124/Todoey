//
//  ViewController.swift
//  Todoey
//
//  Created by Alexandr on 4/16/19.
//  Copyright © 2019 14StreetCrew. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Buy iPhone", "visit Odessa", "buy a flat"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
         cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

}

