//
//  ViewController.swift
//  FutureTechSnapKit
//
//  Created by Mehmet Arıkan on 10.02.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Future Tech"
        label.font = .boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Marker Felt", size: 30)
        return label
    }()
    
    lazy var headerInfo: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont(name: "Arial Black", size: 22)
        return label
    }()
    lazy var imageConnected: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "point.3.filled.connected.trianglepath.dotted")
        image.tintColor = .white
        return image
    }()
    
    let imageWidth: CGFloat = 100
    
    
    // One: Washing
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth/2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
    }()
    
    lazy var bottomTitle: UILabel = {
        let title = UILabel()
        title.text = "Washing"
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 14)
        return title
    }()
    // Two: Dishwasher
    lazy var profileImageViewTwo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth/2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
    }()
    
    lazy var bottomTitleTwo: UILabel = {
        let title = UILabel()
        title.text = "Dishwasher"
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 14)
        return title
    }()
    
    //Three: Freezer
    
    lazy var profileImageViewThree: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = imageWidth/2
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.black.withAlphaComponent(0.1).cgColor
        return imageView
    }()
    
    lazy var bottomTitleThree: UILabel = {
        let title = UILabel()
        title.text = "Freezer"
        title.textColor = .white
        title.font = .boldSystemFont(ofSize: 14)
        return title
    }()
    
    // UIView
    
    lazy var propertysTechGroup: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        return view
    }()
    
    // UIImage - Icon
    
    lazy var propertyOne: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "bolt.ring.closed"))
        view.tintColor = .white
        return view
    }()
    
    lazy var propertyTwo: UIImageView = {
        let view = UIImageView(image: UIImage(systemName: "lock.open"))
        view.tintColor = .white
        return view
    }()
    
    // UISwitch
    
    lazy var switchButtonOne: UISwitch  = {
        let view = UISwitch()
        view.isOn = true
        view.setOn(true, animated: true)
        return view
    }()
    
    lazy var switchButtonTwo: UISwitch  = {
        let view = UISwitch()
        view.isOn = true
        view.setOn(true, animated: true)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        view.backgroundColor = .systemFill
    }
    
    func setupView(){
        //Add Subview
        view.addSubview(headerTitle)
        view.addSubview(profileImageView)
        view.addSubview(bottomTitle)
        view.addSubview(headerInfo)
        view.addSubview(imageConnected)
        view.addSubview(profileImageViewTwo)
        view.addSubview(bottomTitleTwo)
        view.addSubview(profileImageViewThree)
        view.addSubview(bottomTitleThree)
        view.addSubview(propertysTechGroup)
        propertysTechGroup.addSubview(propertyOne)
        propertysTechGroup.addSubview(propertyTwo)
        propertysTechGroup.addSubview(switchButtonOne)
        propertysTechGroup.addSubview(switchButtonTwo)
        
        headerTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.trailing.equalToSuperview().inset(24)
        }
        headerInfo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.equalToSuperview().offset(-24)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        imageConnected.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(58)
            make.right.equalToSuperview().offset(-40)
            make.height.equalTo(25)
            make.width.equalTo(25)
        }
        
        profileImageView.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(headerTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(30)
        }
        bottomTitle.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
        }
        profileImageViewTwo.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(headerTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(150)
        }
        bottomTitleTwo.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(160)
        }
        profileImageViewThree.snp.makeConstraints { make in
            make.width.height.equalTo(imageWidth)
            make.top.equalTo(headerTitle.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(275)
        }
        bottomTitleThree.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(300)
        }
        propertysTechGroup.snp.makeConstraints { make in
            make.top.equalTo(bottomTitle.snp.top).offset(40)
            make.width.height.equalToSuperview()
        }
        propertyOne.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.equalTo(-150)
            make.height.width.equalTo(100)
        }
        switchButtonOne.snp.makeConstraints { make in
            make.top.equalTo(propertyOne.snp.bottom).offset(10)
            make.right.equalTo(-130)
            make.height.width.equalTo(100)
        }
        // button
        propertyTwo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(250)
            make.right.equalTo(-150)
            make.height.width.equalTo(100)
        }
        
        switchButtonTwo.snp.makeConstraints { make in
            make.top.equalTo(propertyTwo.snp.bottom).offset(10)
            make.right.equalTo(-130)
            make.height.width.equalTo(100)
        }
        
    }
    
}

