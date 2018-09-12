//
//  DisplayDepartmentList+UITableViewDataSource+UITableViewDelegate.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import Foundation
import UIKit

extension DisplayDepartmentList: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfDepartments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let oneCell = listOfDepartments[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentTableCell", for: indexPath) as! DepartmentTableCell
        cell.setData(row: oneCell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118.0
    }
}
