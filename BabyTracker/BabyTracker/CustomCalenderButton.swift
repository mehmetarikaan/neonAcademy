//
//  CustomCalenderButton.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 21.03.2023.
//

import UIKit
import SnapKit

final class CustomCalenderButton: UIButton {

    init(normal: String, selected: String) {
        super.init(frame: .zero)
        
        imageView?.contentMode = .scaleAspectFit
        setImage(UIImage(named: normal)?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        setImage(UIImage(named: selected)?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
