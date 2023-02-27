//
//  File.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 23.02.2023.
//

import UIKit
import SnapKit
import FirebaseAuth

class ImageSelectorController: UIViewController {
    
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(logOutPressed), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    @objc func logOutPressed(){
        do {
            print("sea")
            try Auth.auth().signOut()
            let vc = LoginViewController()
            navigationController?.pushViewController(vc, animated: true)
        } catch {
            print("sedfdsfa")
        }
    }
}

