//
//  Employee.swift
//  Employee
//
//  Created by Vikhyath on 05/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import Foundation

class EmployeeObject {
    
    var name: String
    var empID: String
    var gender: String
    var address: String
    var department: Department
    
    init(name: String, empId: String, gender: String, address: String, department: Department) {
        self.address = address
        self.empID = empId
        self.gender = gender
        self.name = name
        self.department = department
    }
}
