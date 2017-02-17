//
//  ShoppingList + Convenience.swift
//  ShoppingList
//
//  Created by Clay Mills on 2/17/17.
//  Copyright © 2017 Clay Mills. All rights reserved.
//

import Foundation
import CoreData
// extension of CoreData entity
// import import CoreData
// connects MOC with CoreDataStack.file
// turn coreData into list

extension List {
    
    @discardableResult convenience init(name: String, viewed: Bool = false, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.name = name
        self.viewed = viewed 
    }
}

