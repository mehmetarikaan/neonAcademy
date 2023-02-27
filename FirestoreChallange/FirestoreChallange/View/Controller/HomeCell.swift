//
//  HomeCell.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit
import SnapKit

protocol FeedCellDelegate: AnyObject {
    func cell(_ cell: HomeCell, wantsToShowCommentsFor post: Post)
}

final class HomeCell: UICollectionViewCell {
    // MARK: - Properties
    var viewModel: PostViewModel? {
        didSet { configure() }
    }
    weak var delegate: FeedCellDelegate?
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "NeonAppsLogo")
        iv.layer.cornerRadius = 40 / 2
        //let tap = UITapGestureRecognizer(target: self, action: #selector(showUserProfile))
        //iv.addGestureRecognizer(tap)
        return iv
    }()
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Neon Apps", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.addTarget(self, action: #selector(showUserProfile), for: .touchUpInside)
        return button
    }()
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = UIImage(named: "banana-tree")
        return iv
    }()
    lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .black
        //button.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
        return button
    }()
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(didTapComments), for: .touchUpInside)
        return button
    }()
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 13)
        label.text = "2 likes"
        label.textColor = .black
        return label
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 days ago"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    private var stackView = UIStackView()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(12)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        addSubview(usernameButton)
        usernameButton.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView.snp_centerYWithinMargins)
            make.left.equalTo(profileImageView.snp_rightMargin).offset(16)
        }
        addSubview(postImageView)
        postImageView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp_bottomMargin).offset(16)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(postImageView.snp.width)
        }
        configureActionButtons()
        addSubview(likesLabel)
        likesLabel.snp.makeConstraints { make in
            make.top.equalTo(likeButton.snp_bottomMargin).offset(6)
            make.left.equalToSuperview().offset(16)
        }
        addSubview(captionLabel)
        captionLabel.snp.makeConstraints { make in
            make.top.equalTo(likesLabel.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
        }
        addSubview(postTimeLabel)
        postTimeLabel.snp.makeConstraints { make in
            make.top.equalTo(captionLabel.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(16)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Selectors
    @objc func showUserProfile() {
        print("showUserProfile")
    }
    @objc func didTapComments() {
        guard let viewModel = viewModel else { return }
        delegate?.cell(self, wantsToShowCommentsFor: viewModel.post)
    }
    // MARK: - Helpers
    func configure() {
        guard let viewModel = viewModel else { return }
        captionLabel.text = viewModel.caption
        postImageView.sd_setImage(with: viewModel.imageUrl)
        
        profileImageView.sd_setImage(with: viewModel.userProfileImageUrl)
        usernameButton.setTitle(viewModel.username, for: .normal)
    }
    func configureActionButtons() {
        stackView = UIStackView(arrangedSubviews: [likeButton, commentButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp_bottomMargin)
            make.width.equalTo(120)
            make.height.equalTo(50)
        }
    }
}

