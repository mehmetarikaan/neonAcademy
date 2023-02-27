//
//  InputTextView.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit

class InputTextView: UITextView {
    // MARK: - Properties
    var placeholderText: String? {
        didSet { placeholderLabel.text = placeholderText }
    }
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        return label
    }()
    var placeholderShouldCenter = true {
        didSet {
            if placeholderShouldCenter {
                placeholderLabel.snp.makeConstraints { make in
                    make.left.equalToSuperview().offset(8)
                    make.right.equalToSuperview()
                    make.centerX.equalTo(self.snp_centerXWithinMargins)
                }
            } else {
                placeholderLabel.snp.makeConstraints { make in
                    make.top.equalToSuperview().offset(6)
                    make.left.equalToSuperview().offset(8)
                }
            }
        }
    }
    // MARK: - Lifecycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(8)
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextDidChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Selectors
    @objc func handleTextDidChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
}

