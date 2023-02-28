//
//  SecondViewController.swift
//  FirebaseStorageChallange
//
//  Created by Mehmet Arıkan on 28.02.2023.
//

import UIKit
import FirebaseStorage
import SnapKit
import SafariServices
import Photos

class SecondViewController: UIViewController {
    private let storage = Storage.storage().reference()
    var urlPicture: String?
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = urlPicture
        label.textColor = .black
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    lazy var downloadImageButton : UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Download", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .white
        button.layer.cornerRadius = 20
        button.sizeToFit()
        button.addTarget(self, action: #selector(handleDownloadButton), for: .touchUpInside)
        return button
    }()
    
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 16
        iv.layer.masksToBounds = true
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        
        guard let urlString = UserDefaults.standard.value(forKey: "url") as? String,
        let url = URL(string: urlString) else { return }
        
        titleLabel.text = urlString
        
        let task = URLSession.shared.dataTask(with: url,completionHandler: { data, _, error in
            guard let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: data)
                self.imageView.image = image
            }
        })
        task.resume()
    }
    
    func setupUI(){
        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
        
        view.addSubview(downloadImageButton)
        downloadImageButton.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(50)
        }
        
        view.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(downloadImageButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(60)
            make.trailing.equalToSuperview().inset(60)
            make.height.equalTo(200)
        }
    }
    
    @objc func handleDownloadButton(){
        UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
    }
}
