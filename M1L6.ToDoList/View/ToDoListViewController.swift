//
//  ToDoListViewController.swift
//  M1L6.ToDoList
//
//  Created by Денис Карпов on 18.02.2023.
//

import UIKit

class ToDoListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = .white
		title = "To Do List"
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
}
