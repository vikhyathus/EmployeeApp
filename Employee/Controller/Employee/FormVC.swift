//
//  FormVC.swift
//  Employee
//
//  Created by Vikhyath on 05/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class FormVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var genderField: UITextField!
    @IBOutlet weak var addressField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var pickerViewDataSource: [String] = []
    var searchString: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDepartments()
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        pickerViewDataSource.removeAll()
//        pickerView.reloadAllComponents()
//    }
    
    @IBAction func addEmployeeButton(_ sender: UIButton) {
        addEmpItem()
    }
    
    func fetchDepartments()  {
        let context = managedObjectContext()
        let request = NSFetchRequest<Department>(entityName: "Department")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
    
        do {
            let obj = try context.fetch(request)
            for dep in obj {
                pickerViewDataSource.append(dep.name!)
            }
        }
        catch {
        print("error i guess!!")
        }
    }
    
    
    func getDepartment(searchText: String) ->Department {

        let context = managedObjectContext()
        let pred = NSPredicate(format: "name == %@", searchText)
        let request = NSFetchRequest<Department>(entityName: "Department")
        request.predicate = pred
        var tempDep: Department?
        do {
            let obj = try context.fetch(request)
            for dep in obj {
                tempDep = dep
                return dep
            }
        }
        catch {
            print("Some error")
        }
        return tempDep!
    }
    
    func addEmpItem(){

        let context = managedObjectContext()
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        entity.address = addressField.text
        entity.empID = idField.text
        entity.gender = genderField.text
        entity.name = nameField.text
        entity.worksfor = getDepartment(searchText: searchString)
        
        do {
            try context.save()
                let alert = UIAlertController(title: "STATUS", message: "The record is successfully inserted!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
            
        }
        catch {
            let alert = UIAlertController(title: "STATUS", message: "A record with same empID already exists", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        }
        
    }

    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }

}
