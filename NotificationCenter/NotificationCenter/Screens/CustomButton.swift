//
//  CustomButton.swift
//  NotificationCenter
//
//  Created by Mehmet Arıkan on 10.02.2023.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = #colorLiteral(red: 0.1220499948, green: 0.1906306446, blue: 0.2015277445, alpha: 1)
        layer.cornerRadius = 6
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
