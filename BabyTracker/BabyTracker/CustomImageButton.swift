//
//  CustomImageButton.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 21.03.2023.
//

import UIKit
import SnapKit

final class CustomImageButton: UIButton {

    init(normal: String) {
        super.init(frame: .zero)
        
        imageView?.contentMode = .scaleAspectFit
        setImage(UIImage(named: normal)?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

