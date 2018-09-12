//
//  DepartmentEmployeeCell.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit

class DepartmentEmployeeCell: UITableViewCell {

    @IBOutlet weak var employeeNameLabel: UILabel!
    
    func setData(row: EmployeeObject) {
        self.employeeNameLabel.text = row.name
    }

}
