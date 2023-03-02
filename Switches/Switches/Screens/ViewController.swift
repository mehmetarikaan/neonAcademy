//
//  ViewController.swift
//  Switches
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

// kapandığında yeşil olcak

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var switches: UISwitch = {
        let switchs = UISwitch()
        switchs.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
        switchs.isOn = true
        switchs.setOn(true, animated: false)
        switchs.onTintColor = .red
        
        return switchs
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupUI()
        
    }
    
    func setupUI(){
        view.addSubview(switches)
        
        switches.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.centerX.equalTo(view.center)
        }
    }
    @objc func switchStateDidChange(_ sender: UISwitch!){
        if sender.isOn{
            view.backgroundColor = .green
            switches.onTintColor = .red
        } else {
            view.backgroundColor = .red
            switches.onTintColor = .green
            switches.backgroundColor = .green
          
        }
        
    }
}

