//
//  CustomNoteTextField.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 21.03.2023.
//

import UIKit

final class CustomNoteTextView: UITextField {

    private let indentView = UIView(frame: CGRect(x: 0, y:0, width: 20, height: 10))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        text = "Note"
        backgroundColor = #colorLiteral(red: 0.9490196109, green: 0.9490197301, blue: 0.9490196109, alpha: 1)
        textColor = #colorLiteral(red: 0.7372547984, green: 0.737255156, blue: 0.745862782, alpha: 1)
        font = .systemFont(ofSize: 14)
        layer.cornerRadius = 25
        layer.fillMode = .backwards
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
