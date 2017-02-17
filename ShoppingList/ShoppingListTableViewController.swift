//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Clay Mills on 2/17/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import UIKit
import CoreData
// import coreData
//conform to CellDelegate
//NumberOfRowsInSection
//CellForRowAtIndexPath(as? to Cell)
//IBActions
//func for IBActions
// create contstants for alertControllers(save and canceling)
// set up delete func

class ShoppingListTableViewController: UITableViewController, ShoppingLIstDetailTableViewCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ShoppingListController.sharedController.items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "listNameCell", for: indexPath) as? ShoppingLIstDetailTableViewCell else {return UITableViewCell()}
        let list = ShoppingListController.sharedController.items[indexPath.row]
        cell.item = list
        cell.delegate = self
        
        // Configure the cell...
        
        return cell
    }
    func listNameCellButtonTapped(sender: ShoppingLIstDetailTableViewCell) {
        
        guard let name = sender.item, let indexPath = tableView.indexPath(for: sender) else {return}
        
        ShoppingListController.sharedController.toggleHasViewedFrom(name: name)
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func addNameTapped(_ sender: Any) {
        let alertController = UIAlertController(title: "Add name", message: "Enter name", preferredStyle: .alert)
        
        var nameListTextField: UITextField?
        
        alertController.addTextField { (UITextField) in
            nameListTextField = UITextField
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let saveAction = UIAlertAction(title: "Save", style: .default) { (_)
            in
            guard let title = nameListTextField?.text else {return}
            ShoppingListController.sharedController.add(name: title)
            
            self.tableView.reloadData()
        }
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let name = ShoppingListController.sharedController.items[indexPath.row]
            ShoppingListController.sharedController.delete(name: name)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
        
    }
}
