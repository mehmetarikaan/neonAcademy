//
//  ViewController.swift
//  SlidersChallenge
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

//MARK: - FATAL 
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var firstSlider: UISlider = {
        let slider = UISlider()
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .red
        slider.maximumValue = 100
        slider.minimumValue = 0
        slider.thumbTintColor = .blue
        slider.setValue(50, animated: true)
        slider.isContinuous = true
        slider.addTarget(self, action: #selector(valueChangedFunc), for: .valueChanged)
        
        return slider
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func valueChangedFunc(_ sender: UISlider) {
        //  color.setGreen(green: sender.value)
        print(sender.value)
        
    }
    
    func setupUI(){
        view.addSubview(firstSlider)
        
        firstSlider.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.right.equalTo(-40)
            make.left.equalTo(40)
        }
        
        
    }
    
    
}

