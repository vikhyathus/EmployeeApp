//
//  DisplayDepartmentList.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class DisplayDepartmentList: UIViewController {
    
    var listOfDepartments: [DepartmentObject] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDepartmentDetails()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOfDepartments.removeAll()
        fetchDepartmentDetails()
        tableView.reloadData()
    }
    
    func fetchDepartmentDetails()  {
        
        let context = managedObjectContext()
        let request = NSFetchRequest<Department>(entityName: "Department")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let obj = try context.fetch(request)
            listOfDepartments.removeAll()
            for emp in obj {
                print(emp.depID!)
                listOfDepartments.append(DepartmentObject(depID: emp.depID!, depName: emp.name!))
            }
        }
        catch {
            print("error i guess!!")
        }
    }
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

}
