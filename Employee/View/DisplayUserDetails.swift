//
//  DisplayUserDetails.swift
//  Employee
//
//  Created by Vikhyath on 05/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import UIKit

class DisplayUserDetails: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var empIDLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    var name: String!
    var empid: String!
    var gender: String!
    var address: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        empIDLabel.text = empid
        genderLabel.text = gender
        addressLabel.text = address
    }
}

