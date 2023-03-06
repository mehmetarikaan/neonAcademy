//
//  DetailViewController.swift
//  TableViewChallange
//
//  Created by Mehmet Arıkan on 6.03.2023.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - Properties
    let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        return label
    }()
    let agesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return label
    }()
    let homeTownLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.textColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        return label
    }()
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        return label
    }()
    private let logoImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "NeonLogo")
        return iv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(fullnameLabel)
        fullnameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.left.equalToSuperview().offset(20)
        }
        view.addSubview(agesLabel)
        agesLabel.snp.makeConstraints { make in
            make.left.equalTo(fullnameLabel.snp_rightMargin).offset(4)
            make.centerY.equalTo(fullnameLabel)
        }
        view.addSubview(homeTownLabel)
        homeTownLabel.snp.makeConstraints { make in
            make.top.equalTo(fullnameLabel.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(20)
        }
        view.addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(homeTownLabel.snp_bottomMargin).offset(8)
            make.left.equalToSuperview().offset(20)
        }
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(30)
            make.height.equalTo(60)
            make.width.equalTo(60)
        }
    }

}
