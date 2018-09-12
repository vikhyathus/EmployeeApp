//
//  FormVC+PickerViewDelegate+PickerViewDataSource .swift
//  Employee
//
//  Created by Vikhyath on 12/09/18.
//  Copyright © 2018 Vikhyath. All rights reserved.
//

import Foundation
import UIKit

extension FormVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        print(pickerViewDataSource.count)
        return pickerViewDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
        searchString = pickerViewDataSource[row]
    }
}
