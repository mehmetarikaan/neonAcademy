//
//  ViewController.swift
//  FirebaseAuthenticationChallange
//
//  Created by Mehmet Arıkan on 22.02.2023.
//

import UIKit
import Lottie
import SnapKit
import Firebase
import FirebaseAuth

class ForgotPasswordViewController: UIViewController {
    private var animationView: LottieAnimationView!
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Reset Password"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    lazy var emailTextFields: UITextField = {
        var text = UITextField()
        text.placeholder = "Enter email"
        text.textColor = .systemGray
        text.textAlignment = .left
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 10
        return text
    }()
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sent Mail", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(emailSent), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func emailSent(){
        Auth.auth().sendPasswordReset(withEmail: emailTextFields.text!) { error in
            if self.emailTextFields.text != nil {
                let vc = LoginViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func setupUI(){
        view.backgroundColor = .white
        animationView = .init(name: "fishTwo")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.animationSpeed = 1.0
        animationView.play()
    
        animationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        view.addSubview(labelTitle)
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        view.addSubview(emailTextFields)
        emailTextFields.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextFields.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
    }
}
