//
//  extensions.swift
//  TodoList App
//
//  Created by R on 12/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

extension ViewController{
    
    func create(title: String, description: String, date: Date){
        let taskItem = ToDo(context: context) // important
        taskItem.title = title
        taskItem.description1 = description
        taskItem.id = UUID()
        taskItem.date = date
        taskItem.isChecked = false
            do {
                try context.save()
                print("create() Success")
                read()
            } catch {
                print("\(error)")
        }
    }
    
    func read(){
        do {
            toDoList = try context.fetch(ToDo.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print("getTask() Success")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func update(title1:ToDo,title2:Bool){
        title1.isChecked = title2
        do {
              try context.save()
              print("upd() Success")
               read()
                       
            } catch {
               print("\(error)")
        }
    }
    
    func delete(title:ToDo){
        context.delete(title)
        
            do {
                try context.save()
                print("del() Success")
                read()
                
            } catch {
                print("\(error)")
        }

    }
    

    
}

extension UIButton {
//MARK:- Animate check mark
func checkboxAnimation(closure: @escaping () -> Void){
    guard let image = self.imageView else {return}
    
    UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
        image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }) { (success) in
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            closure()
            image.transform = .identity

            if self.isSelected{
              // self.isSelected = !self.isSelected
                let imgs = UIImage(systemName: "checkmark.circle")
               self.setImage(imgs, for: UIControl.State.normal)
            }else{
                //self.isSelected = !self.isSelected
                let imgs = UIImage(systemName: "circle")
               self.setImage(imgs, for: UIControl.State.normal)
            }
        }, completion: nil)
    }
    
  }
    
}

