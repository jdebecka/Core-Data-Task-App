//
//  CompleteToDoItemViewController.swift
//  Core Data Task App
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class CompleteToDoItemViewController: UIViewController {
    @IBOutlet weak var nameLAbel: UILabel!
    
    var toDoItem : ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let toDo = toDoItem {
            if toDo.important {
                nameLAbel.text = "‼️\(String(describing: toDo.name!))"
            }else {
                nameLAbel.text = "\(String(describing: toDo.name!))"
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        
    }

}
