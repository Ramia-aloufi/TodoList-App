//
//  Protocol.swift
//  TodoList App
//
//  Created by R on 12/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import Foundation

protocol addToDo {
    func addItem(title:String,description:String,date:Date)
    func updateItem(title:ToDo,checked:Bool)
}
