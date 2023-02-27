//
//  InputConteinerView.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit
import SnapKit

// MARK: - Used Login and SignUp Screen

final class InputContainerView: UIView {
    
    init(image: UIImage?, textField: UITextField) {
        super.init(frame: .zero)
        
        self.snp.makeConstraints { make in
            make.height.equalTo(50)
        }
        
        let iv = UIImageView()
        iv.image = image
        iv.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        iv.alpha = 0.87
        
        addSubview(iv)
        iv.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalToSuperview().offset(8)
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        addSubview(textField)
        textField.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(iv.snp_rightMargin).offset(14)
            make.bottom.equalToSuperview().offset(-8)
            make.right.equalToSuperview()
        }
        
        let dividerView = UIView()
        dividerView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        addSubview(dividerView)
        dividerView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.75)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
