//
//  CoreDataStack.swift
//  ShoppingList
//
//  Created by Clay Mills on 2/17/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation
import CoreData
// import CoreData
// create container for PersistentContainer(sets up whole enchilada)
// name is name of file
// create context

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "ShoppingList")
        container.loadPersistentStores() { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Fatal error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    static var context: NSManagedObjectContext{return container.viewContext}
}

