//
//  TaskTableViewCell.swift
//  Task-CoreData
//
//  Created by Ben Erekson on 7/27/21.
//

import UIKit

protocol TaskCellDelegate: AnyObject {
    func completionButtonTapped()
}
class TaskTableViewCell: UITableViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Properties
    var task: Task?{
        didSet{
            updateViews()
        }
    }
    var delegate:  TaskCellDelegate?
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        guard let task = task else { return }
        TaskController.shared.toggleIsComplete(task: task)
        delegate?.completionButtonTapped()
    }
    
    //MARK: - Helper Methods
    func updateViews(){
        guard let task = task else { return }
        taskNameLabel.text = task.name
        
        let image = task.isComplete ? UIImage(named: "complete") : UIImage(named: "incomplete")
        completionButton.setImage(image, for: .normal)
    }
}
