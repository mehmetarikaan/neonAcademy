//
//  ViewController.swift
//  SlidersChallenge
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

//MARK: - FATAL

//     Ejdarha ekle // eklendi
import UIKit
import SnapKit

class ViewController: UIViewController {
    var color: Color!
    
    private var dragonImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "dragon")
        return image
     }()
    
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
        color = Color(green: CGFloat(slider.value),
                      red: CGFloat(slider.value),
                      blue: CGFloat(slider.value))
        return slider
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        
        
    }
    
    @objc func valueChangedFunc(_ sender: UISlider) {
        view.backgroundColor = color?.getColor()
        color?.setGreen(green: sender.value)
    }
    
    func setupUI(){
        
        view.addSubview(dragonImage)
        dragonImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
        view.addSubview(firstSlider)
        firstSlider.snp.makeConstraints { make in
            make.top.equalTo(dragonImage.snp.bottom).offset(40)
            make.right.equalTo(-40)
            make.left.equalTo(40)
        }
    }
}

