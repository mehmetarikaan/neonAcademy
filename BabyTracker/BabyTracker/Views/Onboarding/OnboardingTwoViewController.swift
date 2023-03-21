//
//  OnboardingTwoViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

import UIKit
import SnapKit
import Hero

final class OnboardingTwoViewController: UIViewController {
    //MARK: - Properties
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_2")
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
        label.text = "Learn About Your Baby"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 32, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Customize your baby's profile, set reminders for important activities, and view detailed reports on your baby's progress"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageController: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "slider2")
        return image
    }()
    
    lazy var customButton = CustomButton(title: "Next")
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
        let viewThree = OnboardingThreeViewController()
        viewThree.hero.isEnabled = true
        navigationController?.pushViewController(viewThree, animated: true)
    }
    
    //MARK: - Helpers
    func setupUI(){
        customButton.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
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
            make.top.equalTo(titleLabel.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
        }
        view.addSubview(customButton)
        customButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(customButton.snp.width).multipliedBy(0.18)
        }
        image.addSubview(imageController)
        imageController.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(customButton).inset(74)
        }
    }
}
