//
//  CustomButton.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.cornerRadius = 25
        heightAnchor.constraint(equalToConstant: 55).isActive = true
        widthAnchor.constraint(equalToConstant: 350).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
