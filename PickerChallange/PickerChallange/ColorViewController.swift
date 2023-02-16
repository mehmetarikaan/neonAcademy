//
//  ColorViewController.swift
//  PickerChallange
//
//  Created by Mehmet Arıkan on 16.02.2023.
//

import UIKit

class ColorViewController: UIViewController {
    
    lazy var collorPicker: UIColorWell = {
        let color = UIColorWell()
        color.supportsAlpha = true
        color.selectedColor = .systemRed
        color.title = "Color Picker"
        color.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        color.addTarget(self, action: #selector(valueChangedColor), for: .valueChanged)
       
        return color
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupColor()
    }
    func setupColor(){
        view.backgroundColor = .systemRed
        collorPicker.backgroundColor = .systemBlue
        view.addSubview(collorPicker)
    }
    override func viewDidLayoutSubviews() {
        collorPicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }
    }
    @objc func valueChangedColor(){
        view.backgroundColor = collorPicker.selectedColor
    }
}
