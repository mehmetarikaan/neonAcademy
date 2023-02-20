//
//  DetailViewController.swift
//  CollectionViewsChallange
//
//  Created by Mehmet Arıkan on 20.02.2023.
//

import UIKit
import SafariServices
import SnapKit

final class DetailViewController: UIViewController {
    var viewModel: AppViewModel? {
        didSet { configure() }
    }
    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        contentView.layer.cornerRadius = 20
        return contentView
    }()
    private let appLogo: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    private let appName: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 30)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let appDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 26)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let appCategory: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 22)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private lazy var urlButton: UIButton = {
        let button = UIButton()
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(selector), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        configureUI()
    }
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
            make.bottom.equalToSuperview().inset(64)
        }
        contentView.addSubview(appLogo)
        
        appLogo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(128)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
            make.height.equalTo(120)
        }
        
        contentView.addSubview(appName)
        
        appName.snp.makeConstraints { make in
            make.top.equalTo(appLogo.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        contentView.addSubview(appDescription)
        
        appDescription.snp.makeConstraints { make in
            make.top.equalTo(appName.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        contentView.addSubview(appCategory)
        
        appCategory.snp.makeConstraints { make in
            make.top.equalTo(appDescription.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(32)
            make.trailing.equalToSuperview().inset(32)
        }
        
        contentView.addSubview(urlButton)
        
        urlButton.snp.makeConstraints { make in
            make.top.equalTo(appCategory.snp.bottom).offset(32)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
        }
        
    }
    func configure() {
        guard let viewModel = viewModel else { return }
        appLogo.image = viewModel.appLogo
        appName.text = viewModel.appName
        appDescription.text = viewModel.description
        appCategory.text = viewModel.category
    }
    @objc func selector() {
        if let url = URL(string: viewModel!.link)
         {
           let safariVC = SFSafariViewController(url: url)
           present(safariVC, animated: true, completion: nil)
         }
    }
}
