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
    }
}
