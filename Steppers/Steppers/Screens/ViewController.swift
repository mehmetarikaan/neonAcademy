//
//  ViewController.swift
//  Steppers
//
//  Created by Mehmet Arıkan on 14.02.2023.
//


// Divider ekle -- eklendi
//line.diagonal

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let images = ["imageZero","imageOne", "imageTwo", "imageThree", "imageFour", "imageFive"]
    
    lazy var steppers: UIStepper = {
       let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 50
        stepper.stepValue = 5
        stepper.backgroundColor = .systemPink
        stepper.setDividerImage(UIImage(systemName: "line.diagonal"), forLeftSegmentState: .normal, rightSegmentState: .normal)
        stepper.layer.bounds = .zero
        stepper.setDecrementImage(UIImage(named: "heart"), for: .normal)
        stepper.setIncrementImage(UIImage(named: "heart.fill"), for: .normal)
        stepper.addTarget(self, action: #selector(selecterPressed), for: .valueChanged)
        //stepper.addTarget(self, action: #selector(pressedStepper), for: )
        return stepper
    }()
    
    lazy var imageSet: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "mmt")
        return image
    }()
    
    lazy var titleLabel: UILabel = {
        let title = UILabel()
        title.text = "0"
        title.textColor = .white
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 30)
        return title
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    
    @objc func selecterPressed(_ sender: UIStepper){
        titleLabel.text = Int(sender.value).description
    }
    func setupUI(){
        view.addSubview(steppers)
        view.addSubview(titleLabel)
        view.addSubview(imageSet)
        
        imageSet.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.top.equalToSuperview().offset(70)
            make.centerX.equalTo(200)
            make.centerY.equalTo(200)
        }
        
        steppers.snp.makeConstraints { make in
            make.width.equalTo(steppers)
            make.height.equalTo(steppers)
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
        }
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(steppers).offset(60)
           // make.height.equalTo(steppers)
            make.height.equalTo(steppers)
            make.width.equalTo(200)
            make.centerX.equalTo(steppers)
            make.centerY.equalTo(steppers)
        }
    }

}

