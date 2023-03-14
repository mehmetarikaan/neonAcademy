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
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    //MARK: - Helpers
    func configureUI(){
        view.backgroundColor = .white
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
        stackOne.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(32)
            make.leading.equalTo(109)
        }
        view.addSubview(stackTwo)
        stackTwo.snp.makeConstraints { make in
            make.top.equalTo(stackOne.snp.top).offset(28)
            make.leading.equalTo(109)
        }
        view.addSubview(stackThree)
        stackThree.snp.makeConstraints { make in
            make.top.equalTo(stackTwo.snp.top).offset(28)
            make.leading.equalTo(109)
        }
    }
}
