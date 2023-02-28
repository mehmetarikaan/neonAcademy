//
//  ViewController.swift
//  FirebaseStorageChallange
//
//  Created by Mehmet Arıkan on 28.02.2023.
//

import UIKit
import SnapKit
import FirebaseStorage

class ViewController: UIViewController {
    
    private var setedImage: UIImage?
    private let storage = Storage.storage().reference()
    var urlPic: String?
    
    //MARK: Properties
    
    lazy var plusPhotoButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .purple
        button.addTarget(self, action: #selector(photoSelected), for: .touchUpInside)
        return button
    }()
    
    lazy var uploadImageButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Upload", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.sizeToFit()
        button.addTarget(self, action: #selector(handleUploadButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nextVCButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.sizeToFit()
        button.addTarget(self, action: #selector(handleNextButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: Lifeycles

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Actions
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(1)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
        
        view.addSubview(uploadImageButton)
        
        uploadImageButton.snp.makeConstraints { make in
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(60)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(50)
        }
        
        view.addSubview(nextVCButton)
        
        nextVCButton.snp.makeConstraints { make in
            make.top.equalTo(uploadImageButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(50)
        }
    }
    
    @objc func photoSelected(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
        
    }
    
    @objc func handleUploadButton(){
        
        guard let imageData = setedImage?.pngData() else {
            return
        }
        
        storage.child("images/").putData(imageData) { _, error in
            guard error == nil else {
                print("Failed upload photo canım")
                print(error?.localizedDescription ?? "hi ı am error")
                return
            }
        }
    }
    
    @objc func handleNextButton(){
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

    //MARK: - UIImagePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        
        setedImage = image
        
        plusPhotoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor.purple.cgColor
        plusPhotoButton.layer.borderWidth = 2
        self.dismiss(animated: true, completion: nil)
        
        
    }
}
