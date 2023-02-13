//
//  SherifViewController.swift
//  UIButtonsChallange
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

import UIKit
import SnapKit

class SherifViewController: UIViewController {
    
    lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("SOS", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(pressedButtonSheriff), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        view.backgroundColor = .systemRed
    }
    
    @objc func pressedButtonSheriff(){
        print("pressed")
    }
    
    func setup(){
        view.addSubview(buttonOne)
        
        buttonOne.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
    }
    
}
