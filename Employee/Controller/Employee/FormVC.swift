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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addEmployeeButton(_ sender: UIButton) {
        addEmpItem()
    }
    
    func addEmpItem(){
        
        let context = managedObjectContext()
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as! Employee
        
        entity.address = addressField.text
        entity.empID = idField.text
        entity.gender = genderField.text
        entity.name = nameField.text
        
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
