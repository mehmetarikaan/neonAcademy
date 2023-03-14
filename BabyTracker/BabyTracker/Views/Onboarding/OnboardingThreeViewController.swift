//
//  OnboardingThreeViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

import UIKit
import SnapKit
import Hero

final class OnboardingThreeViewController: UIViewController {
    //MARK: - Properties
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_3")
        return image
    }()
    lazy var firstView: UIView = {
        let first = UIView()
        first.backgroundColor = .black
        first.isHidden = true
        return first
    }()
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Stay Connected with Caregivers"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Share access to your baby's tracker with family members, babysitters, or healthcare providers"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageController: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "slider3")
        return image
    }()
    
    lazy var customButton: CustomButton = {
       let custom = CustomButton()
        custom.setTitle("Next", for: .normal)
        custom.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return custom
    }()
   //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.hero.isEnabled = true
        imageController.hero.id = "pageController"
        setupUI()
    }
    
    //MARK: - Actions
    @objc func handleNextButton(){
        print("dwfdsf")
        let viewMain = InAppViewController()
        navigationController?.pushViewController(viewMain, animated: true)
    }
    
    //MARK: - Helpers
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(view.center)
           make.bottom.equalToSuperview()
        }
        image.addSubview(firstView)
        firstView.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.centerY.equalTo(view.center)
            make.height.equalTo(1)
            make.width.equalToSuperview()
        }
        
        image.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(firstView.snp.bottom).offset(16)
            make.centerX.equalTo(view.center)
            make.leading.equalToSuperview().offset(44)
            make.trailing.equalToSuperview().inset(44)
        }
        image.addSubview(descLabel)
        descLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.top.equalTo(titleLabel.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        view.addSubview(customButton)
        customButton.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        image.addSubview(imageController)
        imageController.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(customButton).inset(80)
        }
    }
}


