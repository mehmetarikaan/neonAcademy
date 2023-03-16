//
//  OnBoardingOneViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//


import UIKit
import SnapKit
import Hero

final class OnboardingOneViewController: UIViewController {
    //MARK: - Properties
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_1")
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
        label.text = "Track Your Baby's Activities with Ease"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 31, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "Get started with tracking your baby's feedings, diaper changes, sleep patterns, and more..."
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    lazy var imageController: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "slider1")
        return image
    }()
    
    lazy var customButton: CustomButton = {
        let custom = CustomButton()
        custom.setTitle("Next", for: .normal)
        custom.addTarget(self, action: #selector(self.handleNextButton), for: .touchUpInside)
        return custom
    }()
   //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        self.navigationController?.hero.navigationAnimationType = .none
        imageController.hero.id = "pageController"
        setupUI()
    }
    
    //MARK: - Actions
    @objc func handleNextButton(){
        print("32423")
        let viewTwo = OnboardingTwoViewController()
        navigationController?.pushViewController(viewTwo, animated: true)
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
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(customButton.snp.width).multipliedBy(0.18)
        }
        image.addSubview(imageController)
        imageController.snp.makeConstraints { make in
            make.centerX.equalTo(view.center)
            make.bottom.equalTo(customButton).inset(80)
        }
    }
}

