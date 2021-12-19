//
//  ViewController.swift
//  TodoList App
//
//  Created by R on 11/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ViewController: UITableViewController ,addToDo{
    func updateItem(title: ToDo, checked: Bool) {
        update(title1: title, title2: checked)
    }
    

    
    func addItem(title: String, description: String, date: Date) {
        create(title: title, description: description, date: date)
    }


    
    let context = (UIApplication.shared.delegate as!AppDelegate).persistentContainer.viewContext
    var toDoList:[ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        title = "ToDo App"
        read()
        
        for i in toDoList{
            print(i.isChecked)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
        cell.labels[0].text = toDoList[indexPath.row].title
        cell.labels[1].text = formated(string:String(describing: toDoList[indexPath.row].date!))
        cell.labels[2].text = toDoList[indexPath.row].description1
        cell.celldelegat = self
        cell.todoItem  = toDoList[indexPath.row]
        cell.checkbox.isSelected = toDoList[indexPath.row].isChecked
        return cell
    }
    
    func formated(string:String)->String{
        let dateAsString = string
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "MMM d\nHH:mm"
        let date24 = dateFormatter.string(from: date!)
        return date24
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        let AddView = storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
        AddView.delegate = self
        navigationController?.pushViewController(AddView, animated: true)
        
    }
    
}




