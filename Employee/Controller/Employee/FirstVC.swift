//
//  ViewController.swift
//  Employee
//
//  Created by Vikhyath on 05/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class FirstVC: UIViewController {
    
    var listOfEmployees: [EmployeeObject] = []
    var filterData: [EmployeeObject] = []
    var isSeaching = false
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        fetch()
        sortOrder()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        listOfEmployees.removeAll()
        sortOrder()
        tableView.reloadData()
    }
    
    func sortOrder() {
        
        let context = managedObjectContext()
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let obj = try context.fetch(request)
            for emp in obj {
                listOfEmployees.append(EmployeeObject(name: emp.name!, empId: emp.empID!, gender: emp.gender!, address: emp.address!, department: emp.worksfor!))
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

extension FirstVC: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSeaching{
            return filterData.count
        }
        return listOfEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let oneOfTheRow: EmployeeObject
        if isSeaching {
             oneOfTheRow = filterData[indexPath.row]
        }
        else {
              oneOfTheRow = listOfEmployees[indexPath.row]
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCellTableViewCell", for: indexPath) as! TableCellTableViewCell
        cell.setData(row:oneOfTheRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextScreen = storyboard?.instantiateViewController(withIdentifier: "DisplayUserDetails") as! DisplayUserDetails
        if !isSeaching {
            nextScreen.address = listOfEmployees[indexPath.row].address
            nextScreen.empid = listOfEmployees[indexPath.row].empID
            nextScreen.name = listOfEmployees[indexPath.row].name
            nextScreen.gender = listOfEmployees[indexPath.row].gender
            nextScreen.department = listOfEmployees[indexPath.row].department.name
        }
        else {
            nextScreen.address = filterData[indexPath.row].address
            nextScreen.empid = filterData[indexPath.row].empID
            nextScreen.name = filterData[indexPath.row].name
            nextScreen.gender = filterData[indexPath.row].gender
            nextScreen.department = filterData[indexPath.row].department.name
        }
        navigationController?.pushViewController(nextScreen, animated: true)
    }
    
}

extension FirstVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
            isSeaching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
            isSeaching = true
            filterResults(searchText: searchBar.text!)
            tableView.reloadData()
        }
    }
    
    func filterResults(searchText: String) {
        
        filterData.removeAll()
        let context = managedObjectContext()
        
        let pred = NSPredicate(format: "name == %@", searchText)
        
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        request.predicate = pred
        
        do {
            let obj = try context.fetch(request)
            for emp in obj {
                print("filter aagtha ide")
                filterData.append(EmployeeObject(name: emp.name!, empId: emp.empID!, gender: emp.gender!, address: emp.address!, department: emp.worksfor!))
            }
            
        }
        catch {
            print("Some error")
        }
    }
}



