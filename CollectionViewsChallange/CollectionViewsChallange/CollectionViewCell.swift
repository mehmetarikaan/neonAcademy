//
//  CollectionViewCell.swift
//  CollectionViewsChallange
//
//  Created by Mehmet Arıkan on 20.02.2023.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    var viewModel: AppViewModel? {
        didSet { configure() }
    }
    private let appLogo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    private let appName: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Arial", size: 20)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let appDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 12)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let appCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 12)
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let arrowLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 20)
        label.text = "➜"
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        self.layer.cornerRadius = 16
        backgroundColor = #colorLiteral(red: 0.9796730876, green: 0.9796730876, blue: 0.9796730876, alpha: 1)
        addSubview(appLogo)
        addSubview(appName)
        addSubview(appDescription)
        addSubview(appCategory)
        addSubview(arrowLabel)
        
        appLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(64)
        }
        appName.snp.makeConstraints { make in
            make.top.equalTo(appLogo.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        appDescription.snp.makeConstraints { make in
            make.top.equalTo(appLogo.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        appCategory.snp.makeConstraints { make in
            make.top.equalTo(appDescription.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        arrowLabel.snp.makeConstraints { make in
            make.top.equalTo(appCategory.snp.bottom).offset(24)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
    }
    
    func configure(){
        guard let viewModel = viewModel else { return }
        appLogo.image = viewModel.appLogo
        appName.text = viewModel.appName
        appDescription.text = viewModel.description
        appCategory.text = viewModel.category
    }
    
}
