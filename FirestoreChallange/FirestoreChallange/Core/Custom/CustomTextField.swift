//
//  CustomTextField.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit

// MARK: - Used Login and SignUp Screen

final class CustomTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        borderStyle = .none
        font = UIFont.systemFont(ofSize: 16)
        textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        keyboardAppearance = .dark
        attributedPlaceholder = NSAttributedString(string: placeholder,
                                                   attributes: [.foregroundColor : #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

