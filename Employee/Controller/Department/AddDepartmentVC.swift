//
//  AddDepartmentVC.swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit
import CoreData

class AddDepartmentVC: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var depIDField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addDepItem(){
        
        let context = managedObjectContext()
        let entity = NSEntityDescription.insertNewObject(forEntityName: "Department", into: context) as! Department
        entity.name = nameField.text
        entity.depID = depIDField.text
        
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
    
    @IBAction func insertButtonTapped(_ sender: UIButton) {
        addDepItem()
    }
    
    
}
