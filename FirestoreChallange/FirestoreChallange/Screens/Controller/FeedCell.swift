//
//  FeedCell.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 23.02.2023.
//

import UIKit
import SnapKit

class FeedCell: UICollectionViewCell {
    //MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.image = UIImage(named: "mehmet")
        image.layer.cornerRadius = 20
        return image
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("mehmet", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
        
    }()
    
    private let postImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.isUserInteractionEnabled = true
        image.image = UIImage(named: "mehmet")
        return image
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var likeLabel: UILabel = {
        let label = UILabel()
        label.text = "1 like"
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(profileImageView)
        
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalToSuperview().offset(12)
            make.height.width.equalTo(40)
        }
        
        addSubview(usernameButton)
        usernameButton.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
            make.top.equalToSuperview().offset(15)
        }
        
        addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(35)
        }
        configureActionButtons()
        
        addSubview(likeLabel)
        likeLabel.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Actions
    @objc func didTapUsername(){
        print("pressed profile button")
    }
    
    //MARK: - Helpers
    
    func configureActionButtons(){
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp.bottom).offset(5)
            make.height.equalTo(50)
            make.width.equalTo(120)
        }
        
    }
}
