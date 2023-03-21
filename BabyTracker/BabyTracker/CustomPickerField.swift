//
//  CustomPickerField.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 21.03.2023.
//

import UIKit

final class CustomPickerField: UITextField {

    private let indentView = UIView(frame: CGRect(x: 0, y:0, width: 20, height: 10))
    
        init(place:String) {
        super.init(frame: .zero)
        self.leftView = indentView
        self.leftViewMode = .always
        textColor = .black
        font = .boldSystemFont(ofSize: 14)
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        returnKeyType = UIReturnKeyType.done
        clearButtonMode = UITextField.ViewMode.whileEditing;
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        layer.cornerRadius = 25
        placeholder = place
        contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        inputView = datePickerTime
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
