//
//  DepartmentEmployeeVC+UITableViewDelegate+UITableViewDataSource.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import Foundation
import UIKit

extension DepartmentEmployeeVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let oneRow = listOfEmployees[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepartmentEmployeeCell", for: indexPath) as! DepartmentEmployeeCell
        cell.setData(row: oneRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
}
