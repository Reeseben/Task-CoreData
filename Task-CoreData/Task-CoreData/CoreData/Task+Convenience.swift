//
//  Task+Convenience.swift
//  Task-CoreData
//
//  Created by Ben Erekson on 7/27/21.
//

import CoreData

extension Task {
    convenience init(name: String, notes: String? = "", dueDate: Date = Date(), isComplete: Bool = false, context: NSManagedObjectContext = CoreDataStack.context){
        self.init(context: context)
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}
