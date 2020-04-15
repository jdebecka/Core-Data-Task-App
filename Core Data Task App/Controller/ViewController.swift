//
//  ViewController.swift
//  Core Data Task App
//
//  Created by Julia Debecka on 15/04/2020.
//  Copyright © 2020 Julia Debecka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var toDoListItem: [ToDoItem] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        getToDoItems()
    }
    func getToDoItems() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let results = try? context.fetch(ToDoItem.fetchRequest()) as? [ToDoItem] {
                for result in results {
                    if !toDoListItem.contains(result){
                        toDoListItem.append(result)
                        tableView.reloadData()
                    }
                }
            }
        }
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let item = toDoListItem[indexPath.row]
        
        if item.important{
            cell.textLabel?.text = "‼️\(String(describing: item.name!))"
        }else{
            cell.textLabel?.text = item.name
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoListItem[indexPath.row]
        performSegue(withIdentifier: "completeToDoSegue", sender: item)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "completeToDoSegue" {
            if let toDoItem = sender as? ToDoItem {
                if let completeToDoVC = (segue.destination as? CompleteToDoItemViewController) {
                    completeToDoVC.toDoItem = toDoItem
                    
                }
            }
        }
    }
    
    
}
