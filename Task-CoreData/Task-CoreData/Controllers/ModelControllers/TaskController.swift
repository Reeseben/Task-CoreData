//
//  TaskController.swift
//  Task-CoreData
//
//  Created by Ben Erekson on 7/27/21.
//

import Foundation
import CoreData

class TaskController {
    static var shared = TaskController()
    
    ///Source Of Truth
    var tasks: [Task] = []
    
    private lazy var fetchRequest: NSFetchRequest<Task> = {
        let request = NSFetchRequest<Task>(entityName: "Task")
        
        request.predicate = NSPredicate(value: true)
        
        return request
    }()
    
    
    //MARK: - CRUD Functions
    func createTaskWith(name: String, notes: String?, dueDate: Date?){
        tasks.append(Task(name: name, notes: notes))
        
        CoreDataStack.saveContext()
    }
    
    func fetchTasks(){
        tasks = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
    }
    
    func update(task: Task, name: String, notes: String?, dueDate: Date?){
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks[index].name = name
        tasks[index].notes = notes
        tasks[index].dueDate = dueDate
        
        CoreDataStack.saveContext()
    }
    
    func delete(task: Task){
        CoreDataStack.context.delete(task)
        
        CoreDataStack.saveContext()
    }
    
    func toggleIsComplete(task: Task){
        guard let index = tasks.firstIndex(of: task) else { return }
        tasks[index].isComplete.toggle()
        
        CoreDataStack.saveContext()
    }
}
