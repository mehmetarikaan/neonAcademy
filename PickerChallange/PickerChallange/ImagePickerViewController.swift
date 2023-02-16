//
//  ImagePickerViewController.swift
//  PickerChallange
//
//  Created by Mehmet Arıkan on 16.02.2023.
//

import UIKit
import SnapKit

class ImagePickerViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    lazy var imageViewPicker: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.circle.fill")
        imageView.backgroundColor = .black
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        return imageView
    }()
    lazy var myButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 20
        button.tintColor = .white
        button.addTarget(self, action: #selector(buttonImagePicker), for: .touchUpInside)
        
        return button
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Click me! and Next!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 20
        button.tintColor = .black
        button.addTarget(self, action: #selector(nextPagePicker), for: .touchUpInside)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    func setupView(){
        view.addSubview(myButton)
        view.addSubview(imageViewPicker)
        view.addSubview(nextButton)
        
        imageViewPicker.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.equalTo(50)
            make.trailing.equalTo(-50)
            make.height.equalTo(200)
            make.width.equalTo(100)
        }
        
        myButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageViewPicker).offset(100)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(myButton).offset(100)
            make.trailing.equalTo(-50)
            make.leading.equalTo(50)
        }
        
        
    }
    @objc func buttonImagePicker(_ sender: UIButton){
        let imagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = false //If you want edit option set "true"
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let tempImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imageViewPicker.image  = tempImage
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func nextPagePicker(_ sender: UIButton){
        let controllerNextPage = FontPickerViewController()
        navigationController?.pushViewController(controllerNextPage, animated: true)
    }
}
