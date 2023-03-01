//
//  CustomTextField.swift
//  CoreDataChallange
//
//  Created by Mehmet Arıkan on 1.03.2023.
//

import UIKit

final class CustomTextField: UITextField {
    init(placeholder: String, color: UIColor, fontme: UIFont, keyboardtype: UIKeyboardType) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = true
        sizeToFit()
        borderStyle = .roundedRect
        font = fontme
        textColor = color
        keyboardType = keyboardtype
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : color])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
