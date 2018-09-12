//
//  Employee+CoreDataProperties.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//
//

import Foundation
import CoreData


extension Employee {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Employee> {
        return NSFetchRequest<Employee>(entityName: "Employee")
    }

    @NSManaged public var address: String?
    @NSManaged public var empID: String?
    @NSManaged public var gender: String?
    @NSManaged public var name: String?
    @NSManaged public var worksfor: Department?

}
