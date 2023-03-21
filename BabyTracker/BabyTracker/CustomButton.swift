//
//  CustomButton.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

import UIKit
import SnapKit

final class CustomButton: UIButton {

        init(title: String) {
        super.init(frame: .zero)
            setTitle(title, for: .normal)
        setTitleColor(UIColor(white: 1, alpha: 1), for: .normal)
        backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        layer.cornerRadius = 25
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
