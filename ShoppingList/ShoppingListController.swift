//
//  ShoppingListController.swift
//  ShoppingList
//
//  Created by Clay Mills on 2/17/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation
import CoreData
// import coreDate
// CRUD
// set up controller
// func for adding
// use constants for MOC and Fetch with do, try, catch, return
// func for viewed
// func for delete
// func to saveToPersistentStore
// use let moc = CoreDataStack.context to connect to persistentContainer

class ShoppingListController {
    
    static let sharedController = ShoppingListController()
    
    func add(name: String) {
        let _ = List(name: name)
        saveToPersistentStore()
    }
    var items: [List] {
        let request: NSFetchRequest<List> = List.fetchRequest()
        let moc = CoreDataStack.context
        
        do{
            let items = try moc.fetch(request)
            return items
        } catch {
            return []
        }
        
    }
    func toggleHasViewedFrom(name: List) {
        name.viewed = !name.viewed
        saveToPersistentStore()
    }
    func delete(name: List) {
        let moc = CoreDataStack.context
        
        moc.delete(name)
        saveToPersistentStore()
    }
}
func saveToPersistentStore() {
    let moc = CoreDataStack.context
    
    do {
        try moc.save()
    } catch let error {
        print("Error saving MOC:\n\(error)")
    }
}
