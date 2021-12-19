//
//  ToDo+CoreDataProperties.swift
//  TodoList App
//
//  Created by R on 12/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//
//

import Foundation
import CoreData


extension ToDo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ToDo> {
        return NSFetchRequest<ToDo>(entityName: "ToDo")
    }

    @NSManaged public var description1: String?
    @NSManaged public var title: String?
    @NSManaged public var isChecked: Bool
    @NSManaged public var id: UUID?
    @NSManaged public var date: Date?

}
