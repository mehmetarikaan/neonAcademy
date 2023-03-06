//
//  FourthViewController.swift
//  PageControllChallange
//
//  Created by Mehmet Arıkan on 6.03.2023.
//

import UIKit
import SnapKit

final class FourthViewController: UIViewController {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "this is title"
        label.textColor = .systemYellow
        label.font = UIFont(name: "Avenir-Heavy", size: 36)
        return label
    }()
    private let subtitle: UILabel = {
        let label = UILabel()
        label.text = "this is subtitle"
        label.textColor = .systemYellow
        label.font = UIFont(name: "Avenir", size: 30)
        return label
    }()
    private let princeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ekip")
        image.tintColor = .systemYellow
        return image
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(view.center)
        }
        view.addSubview(subtitle)
        subtitle.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.centerX.equalTo(view.center)
        }
        
        view.addSubview(princeImage)
        princeImage.snp.makeConstraints { make in
            make.top.equalTo(subtitle.snp.bottom).offset(10)
            make.height.equalTo(150)
            make.width.equalTo(175)
            make.centerX.equalTo(view.center)
        }
    }
}
