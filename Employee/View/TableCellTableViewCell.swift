//
//  TableCellTableViewCell.swift
//  Employee
//
//  Created by Vikhyath on 05/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit

class TableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    func setData(row: EmployeeObject) {
        nameLabel.text = row.name
//        addressLabel.text = row.address
//        genderLabel.text = row.gender
//        empIDLabel.text = row.empID
    }
}
