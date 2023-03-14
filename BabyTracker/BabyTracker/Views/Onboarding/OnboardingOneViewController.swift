//
//  OnBoardingOneViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//


import UIKit
import SnapKit

final class OnboardingOneViewController: UIViewController {
    
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_1")
        return image
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Track Your Baby's Activities with Ease"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Get started with tracking your baby's feedings, diaper changes, sleep patterns, and more..."
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var customButton: CustomButton = {
       let custom = CustomButton()
        custom.setTitle("Next", for: .normal)
        return custom
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(view.center)
           make.bottom.equalToSuperview()
        }
        image.addSubview(customButton)
        customButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        image.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(customButton).inset(150)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        image.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalTo(descLabel.snp.bottom).inset(100)
            make.centerX.equalTo(view.center)
            make.leading.equalToSuperview().offset(55)
            make.trailing.equalToSuperview().inset(55)
        }
    }
}

