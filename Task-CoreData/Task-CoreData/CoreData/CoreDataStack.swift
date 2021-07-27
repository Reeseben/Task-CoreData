//
//  CoreDataStack.swift
//  Task-CoreData
//
//  Created by Ben Erekson on 7/27/21.
//

import CoreData

enum CoreDataStack {
    
    static let container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Task_CoreData")
        
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading Persistent stores \(error)")
            }
        }
        return container
    }()
    
    static var context: NSManagedObjectContext {
        container.viewContext
    }
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("Error saving context \(error)")
            }
            
        }
    }
    
}
