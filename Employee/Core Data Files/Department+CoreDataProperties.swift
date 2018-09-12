//
//  Department+CoreDataProperties.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//
//

import Foundation
import CoreData


extension Department {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Department> {
        return NSFetchRequest<Department>(entityName: "Department")
    }

    @NSManaged public var depID: String?
    @NSManaged public var name: String?
    @NSManaged public var employeerelation: NSSet?

}

// MARK: Generated accessors for employeerelation
extension Department {

    @objc(addEmployeerelationObject:)
    @NSManaged public func addToEmployeerelation(_ value: Employee)

    @objc(removeEmployeerelationObject:)
    @NSManaged public func removeFromEmployeerelation(_ value: Employee)

    @objc(addEmployeerelation:)
    @NSManaged public func addToEmployeerelation(_ values: NSSet)

    @objc(removeEmployeerelation:)
    @NSManaged public func removeFromEmployeerelation(_ values: NSSet)

}
