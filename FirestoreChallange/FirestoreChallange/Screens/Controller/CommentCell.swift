//
//  CommentCell.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit

final class CommentCell: UICollectionViewCell {
    // MARK: - Properties
    var viewModel: CommentViewModel? {
        didSet { configure() }
    }
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    private let commentLabel = UILabel()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        profileImageView.layer.cornerRadius = 40 / 2
        addSubview(profileImageView)
        profileImageView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalToSuperview().offset(8)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        commentLabel.numberOfLines = 0
        addSubview(commentLabel)
        commentLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.left.equalTo(profileImageView.snp_rightMargin).offset(16)
            make.right.equalToSuperview().inset(8)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Helpers
    func configure() {
        guard let viewModel = viewModel else { return }
        
        profileImageView.sd_setImage(with: viewModel.profileImageUrl)
        commentLabel.attributedText = viewModel.commentLabelText()
    }
}
