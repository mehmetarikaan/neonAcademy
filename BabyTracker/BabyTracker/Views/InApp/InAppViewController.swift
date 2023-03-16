//
//  InAppViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 14.03.2023.
//

import UIKit
import SnapKit

class InAppViewController: UIViewController {
    //MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Get Premium"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 27, weight: .semibold)
        label.textColor = .black
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.3642928302, green: 0.06763256341, blue: 0.967459023, alpha: 1)
        return label
    }()
    
    lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_close"), for: .normal)
        return button
    }()
    
    lazy var imageView: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "img_4")
        return image
    }()
    
    lazy var imageDotOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    lazy var labelOne: UILabel = {
       let label = UILabel()
        label.text = "Share the care"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    lazy var imageDotTwo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    lazy var labelTwo: UILabel = {
       let label = UILabel()
        label.text = "All-in-one baby tracker"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    lazy var imageDotThree: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_matter")
        return image
    }()
    lazy var labelThree: UILabel = {
       let label = UILabel()
        label.text = "Watch your babys growth"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    lazy var backgroundView: UIView = {
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bgView.layer.cornerRadius = 25
        bgView.backgroundColor = .white
        bgView.layer.shadowOpacity = 0.1
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 5
        return bgView
    }()
    
    lazy var weeklyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_premium")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var weeklyLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var weeklyPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "$10"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        return label
    }()

    
    lazy var monthlyImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_premium")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var annualImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img_premium")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var startButton: CustomButton = {
       let button = CustomButton()
        button.setTitle("Start", for: .normal)
        return button
    }()
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
            make.centerX.equalToSuperview()
        }
        view.addSubview(cancelButton)
        cancelButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().inset(20)
        }
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(28)
            make.centerX.equalToSuperview()
        }
        
        let stackOne = UIStackView(arrangedSubviews: [imageDotOne, labelOne])
        stackOne.axis = .horizontal
        stackOne.spacing = -10
        
        let stackTwo = UIStackView(arrangedSubviews: [imageDotTwo, labelTwo])
        stackTwo.axis = .horizontal
        stackTwo.spacing = -10
        
        let stackThree = UIStackView(arrangedSubviews: [imageDotThree, labelThree])
        stackThree.axis = .horizontal
        stackThree.spacing = -10
        view.addSubview(stackOne)
        view.addSubview(stackTwo)
        view.addSubview(stackThree)
        
        
        
        // Label'ların tek stack'te toplanması
//        let stackLabel = UIStackView(arrangedSubviews: [stackOne, stackTwo, stackThree])
//        stackLabel.axis = .vertical
//        stackLabel.distribution = .equalSpacing
//        stackLabel.spacing = 1
        
    
        
        stackOne.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading).offset(-25)
        }
        
        stackTwo.snp.makeConstraints { make in
            make.top.equalTo(stackOne.snp.top).offset(32)
            make.leading.equalTo(titleLabel.snp.leading).offset(-25)
        }
        stackThree.snp.makeConstraints { make in
            make.top.equalTo(stackTwo.snp.top).offset(32)
            make.leading.equalTo(titleLabel.snp.leading).offset(-25)
        }
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(view.snp_centerYWithinMargins).offset(-24)
            make.centerX.equalTo(view.center)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
//        view.addSubview(stackLabel)
//        stackLabel.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(28)
//            make.leading.equalTo(titleLabel.snp.leading).offset(-25)
//            make.bottom.equalTo(backgroundView.snp.top).offset(5)
//        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(82)
            make.left.equalToSuperview().offset(40)
            make.right.equalToSuperview().inset(40)
            make.height.equalTo(startButton.snp.width).multipliedBy(0.18)
        }
      
        let stackPremium = UIStackView(arrangedSubviews: [weeklyImage, monthlyImage, annualImage])
        stackPremium.axis = .vertical
        stackPremium.distribution = .fillEqually
        stackPremium.spacing = 10
        
        backgroundView.addSubview(stackPremium)
        stackPremium.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(20)
            make.bottom.equalTo(startButton.snp.top).offset(-20)
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
        }
        backgroundView.addSubview(weeklyLabel)
        weeklyLabel.snp.makeConstraints { make in
            make.centerY.equalTo(weeklyImage.snp_centerYWithinMargins)
            make.leading.equalTo(weeklyImage.snp_leadingMargin).offset(30)
        }
        
        //Stakcsiz constrait
//        backgroundView.addSubview(weeklyImage)
//        weeklyImage.snp.makeConstraints { make in
//            make.top.equalTo(backgroundView.snp.top).offset(30)
//            make.centerX.equalTo(backgroundView)
//            make.height.equalTo(weeklyImage.snp.width).dividedBy(4.8)
//            make.leading.equalToSuperview().offset(28)
//            make.trailing.equalToSuperview().inset(28)
//        }
//        backgroundView.addSubview(monthlyImage)
//        monthlyImage.snp.makeConstraints { make in
//            make.top.equalTo(weeklyImage.snp.bottom).offset(36)
//            make.centerX.equalTo(backgroundView)
//            make.height.equalTo(weeklyImage.snp.width).dividedBy(4.8)
//            make.leading.equalToSuperview().offset(28)
//            make.trailing.equalToSuperview().inset(28)
//        }
//        backgroundView.addSubview(annualImage)
//        annualImage.snp.makeConstraints { make in
//            make.top.equalTo(monthlyImage.snp.bottom).offset(36)
//            make.centerX.equalTo(backgroundView)
//            make.height.equalTo(weeklyImage.snp.width).dividedBy(4.8)
//            make.leading.equalToSuperview().offset(28)
//            make.trailing.equalToSuperview().inset(28)
//        }
        
    }
}
