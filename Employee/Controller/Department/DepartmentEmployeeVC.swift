//
//  DepartmentEmployeeVC.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class DepartmentEmployeeVC: UIViewController {

    var searchString: String!
    var listOfEmployees: [EmployeeObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchEmployeeDetails()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchEmployeeDetails() {
        
        let context = managedObjectContext()
        let request = NSFetchRequest<Department>(entityName: "Department")
        let pred = NSPredicate(format: "name == %@", searchString)
        request.predicate = pred
        
        //request.returnsObjectsAsFaults = false
        do {
            let obj = try context.fetch(request)
            for dep in obj {
                let employees = dep.employeerelation as! Set<Employee>
                for emp in employees {
                    listOfEmployees.append(EmployeeObject(name: emp.name!, empId: emp.empID!, gender: emp.gender!, address: emp.address!, department: emp.worksfor!))
                }
            }
            
        }
        catch {
            
        }
    }

    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    
}
