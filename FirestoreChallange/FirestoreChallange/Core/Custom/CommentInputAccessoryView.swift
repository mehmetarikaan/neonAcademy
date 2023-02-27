//
//  CommentInputAccessoryView.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit

protocol CommentInputAccesoryViewDelegate: AnyObject {
    func inputView(_ inputView: CommentInputAccesoryView, wantsToUploadComment comment: String)
}

final class CommentInputAccesoryView: UIView {
    // MARK: - Properties
    weak var delegate: CommentInputAccesoryViewDelegate?
    private let commentTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "Enter comment..."
        tv.font = UIFont.systemFont(ofSize: 15)
        tv.isScrollEnabled = false
        tv.placeholderShouldCenter = true
        return tv
    }()
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.setTitle("Post", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handlePostTapped), for: .touchUpInside)
        return button
    }()
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        autoresizingMask = .flexibleHeight
        
        addSubview(postButton)
        postButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview().inset(8)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        addSubview(commentTextView)
        commentTextView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(postButton.snp_leftMargin)
            make.bottom.equalToSuperview().inset(16)
        }
        
        let divider = UIView()
        divider.backgroundColor = .lightGray
        addSubview(divider)
        divider.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init")
    }
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    // MARK: - Actions
    @objc func handlePostTapped() {
        delegate?.inputView(self, wantsToUploadComment: commentTextView.text)
    }
    // MARK: - Helpers
    
    func clearCommentTextView() {
        commentTextView.text = nil
        commentTextView.placeholderLabel.isHidden = false
    }
}

