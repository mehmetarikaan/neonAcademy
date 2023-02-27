//
//  UploadPostController.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 27.02.2023.
//

import UIKit

protocol UploadPostControllerDelegate: AnyObject {
    func controllerDidFinishUploadingPost(_ controller: UploadPostController)
}

class UploadPostController: UIViewController {
    // MARK: - Properties
    weak var delegate: UploadPostControllerDelegate?
    var currentUser: User?
    var selectedImage: UIImage? {
        didSet { photoImageView.image = selectedImage }
    }
    private let photoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    private lazy var captionTextView: InputTextView = {
        let tv = InputTextView()
        tv.placeholderText = "Enter caption..."
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.delegate = self
        return tv
    }()
    private let characterCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.text = "0/100"
        return label
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    // MARK: - Selectors
    @objc func didTapCancel() {
        dismiss(animated: true, completion: nil)
    }
    @objc func didTapDone() {
        guard let image = selectedImage else { return }
        guard let caption = captionTextView.text else { return }
        guard let user = currentUser else { return }
        showLoader(true)
        PostService.uploadPost(caption: caption, image: image, user: user) { error in
            self.showLoader(false)
            if let error = error {
                print("DEBUG: Failed to upload post with error\(error.localizedDescription)")
                return
            }
            self.delegate?.controllerDidFinishUploadingPost(self)
        }
    }
    // MARK: - Helpers
    
    func checkMaxLength(_ textView: UITextView) {
        if (textView.text.count) > 100 {
            textView.deleteBackward()
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Upload Post"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .done,
                                                            target: self, action: #selector(didTapDone))
        view.addSubview(photoImageView)
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.centerX.equalTo(view)
            make.height.equalTo(180)
            make.width.equalTo(180)
        }
        photoImageView.layer.cornerRadius = 10
        
        view.addSubview(captionTextView)
        captionTextView.snp.makeConstraints { make in
            make.top.equalTo(photoImageView.snp_bottomMargin).offset(16)
            make.left.equalToSuperview().offset(12)
            make.right.equalToSuperview().inset(12)
            make.height.equalTo(64)
        }
        view.addSubview(characterCountLabel)
        characterCountLabel.snp.makeConstraints { make in
            make.bottom.equalTo(captionTextView.snp_bottomMargin).offset(8)
            make.right.equalToSuperview().inset(12)
        }
    }
}
    // MARK: - UITextViewDelegate
extension UploadPostController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        checkMaxLength(textView)
        let count = textView.text.count
        characterCountLabel.text = "\(count)/100"
    }
}

