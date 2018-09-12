//
//  DepartmentTableCell.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit

class DepartmentTableCell: UITableViewCell {

    @IBOutlet weak var depNameField: UILabel!
    @IBOutlet weak var depIDField: UILabel!
    
    func setData(row: DepartmentObject) {
        self.depIDField.text = row.depID
        self.depNameField.text = row.depName
    }
}
