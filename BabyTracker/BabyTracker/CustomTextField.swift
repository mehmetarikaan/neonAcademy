//
//  CustomTextField.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 15.03.2023.
//

import UIKit

final class CustomTextField: UITextField {

    private let indentView = UIView(frame: CGRect(x: 0, y:0, width: 10, height: 10))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.leftView = indentView
        self.leftViewMode = .always
        //textAlignment = .left
        textColor = .black
        font = .boldSystemFont(ofSize: 14)
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        returnKeyType = UIReturnKeyType.done
        clearButtonMode = UITextField.ViewMode.whileEditing;
        contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
