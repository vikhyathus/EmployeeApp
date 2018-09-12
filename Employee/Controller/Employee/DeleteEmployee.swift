//
//  DeleteEmployee.swift
//  Employee
//
//  Created by Vikhyath on 06/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class DeleteEmployee: UIViewController {

    @IBOutlet weak var empIDField: UITextField!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteObject()
    }
    
    func deleteObject() {
        
        let searchKey = empIDField.text
        let context = managedObjectContext()
        
        let pred = NSPredicate(format: "empID == %@", searchKey!)
        
        let request = NSFetchRequest<Employee>(entityName: "Employee")
        
        request.predicate = pred
        
        do {
            let obj = try context.fetch(request)
            
            for item in obj {
                context.delete(item)
            }
            
            try context.save()
            
        }
        catch {
            
        }
        
    }
    
    
    func managedObjectContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
