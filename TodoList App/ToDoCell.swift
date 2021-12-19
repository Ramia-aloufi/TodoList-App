//
//  ToDoCell.swift
//  TodoList App
//
//  Created by R on 11/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var viewContainer: UIView!
    
    @IBOutlet weak var checkbox: UIButton!
    
    @IBOutlet var labels: [UILabel]!
    var todoItem:ToDo?
    var celldelegat :addToDo?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        for i in labels{
            i.textColor = .darkGray
        }
        
        
            checkbox.checkboxAnimation {
                if(self.checkbox.isSelected){
                self.viewContainer.backgroundColor = .lightGray
                }
        }
        
        
        
        viewContainer.layer.cornerRadius = 15
        viewContainer.layer.shadowOffset = CGSize(width: 2, height: 3)
        viewContainer.layer.shadowRadius = 0.1
        viewContainer.layer.shadowOpacity = 0.1
        viewContainer.layer.shadowColor = UIColor.lightGray.cgColor
        
    }

    @IBAction func checkBoxAction(_ sender: UIButton) {
        self.celldelegat?.updateItem(title: self.todoItem!, checked: !sender.isSelected)

        sender.checkboxAnimation {
            if(sender.isSelected){
                self.viewContainer.backgroundColor = .lightGray
            }else{
                self.viewContainer.backgroundColor = .white
            }
            print(sender.isSelected)
        }

        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
