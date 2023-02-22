//
//  HomeViewController.swift
//  FirebaseAuthenticationChallange
//
//  Created by Mehmet Arıkan on 22.02.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Login Successful"
        label.textColor = .black
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(toLogin), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUIHome()
    }
    
    func setupUIHome(){
        view.addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
        }
        
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
    }
    
    
    @objc func toLogin(){
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
