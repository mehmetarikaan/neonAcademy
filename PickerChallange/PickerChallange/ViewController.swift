//
//  ViewController.swift
//  PickerChallange
//
//  Created by Mehmet Arıkan on 15.02.2023.
//


// font pickeri ilk sayfadaki labela ata

import UIKit
import SnapKit

class ViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "photo.circle.fill")
        imageView.backgroundColor = .black
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Mehmet Arıkan"
        nameLabel.textAlignment = .center
        nameLabel.textColor = .systemGreen
        nameLabel.font = .systemFont(ofSize: 20)
        return nameLabel
    }()
    lazy var dateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.text = "08/05/1999"
        dateLabel.textAlignment = .center
        dateLabel.textColor = .systemGreen
        dateLabel.font = .systemFont(ofSize: 30)
        return dateLabel
    }()
    lazy var buttonNext: UIButton = {
      let button = UIButton()
        button.setTitle("Next VC", for: .normal)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    func setupUI(){
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        view.addSubview(dateLabel)
        view.addSubview(buttonNext)
        
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).offset(50)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
        dateLabel.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel).offset(40)
            make.leading.equalTo(60)
            make.trailing.equalTo(-60)
        }
        buttonNext.snp.makeConstraints { make in
            make.bottom.equalTo(nameLabel).offset(200)
            make.leading.equalTo(40)
            make.trailing.equalTo(-40)
        }
    }
    @objc func nextButtonPressed(){
        let controller = ImagePickerViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}

