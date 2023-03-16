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

class LoginViewController: UIViewController {
    private var animationView: LottieAnimationView!
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Login"
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
    lazy var passwordTextFields: UITextField = {
       var text = UITextField()
        text.placeholder = "Enter password"
        text.textColor = .systemGray
        text.textAlignment = .left
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 10
        text.isSecureTextEntry = true
        return text
    }()
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(loginPress), for: .touchUpInside)
        return button
    }()
    lazy var alreadyRegisterButton: UIButton = {
       var button = UIButton()
        button.setTitle("Sign up with new account", for: .normal)
        button.tintColor = .black
        button.setTitleColor(.systemGray, for: .normal)
        button.addTarget(self, action: #selector(tosignPress), for: .touchUpInside)
        return button
    }()
    lazy var alreadyLoginButton: UIButton = {
       var button = UIButton()
        button.setTitle("Sign up", for: .normal)
        button.tintColor = .systemGray
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.addTarget(self, action: #selector(tosignPress), for: .touchUpInside)
        return button
    }()
    lazy var forgotButton: UIButton = {
       var button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.tintColor = .systemGray
        button.setTitleColor(.systemBlue, for: .normal)
        
        button.addTarget(self, action: #selector(forgotPress), for: .touchUpInside)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    @objc func forgotPress(){
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
        }
    
    @objc func loginPress() {
        if emailTextFields.text != nil && passwordTextFields.text != nil {
            
            Auth.auth().signIn(withEmail: emailTextFields.text!, password: passwordTextFields.text!) {data, error in
                if error != nil {
                    print(error?.localizedDescription ?? "errorr verdii kardeş")
                } else {
                    let vc = HomeViewController()
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
        
    }
    @objc func tosignPress(){
        let vc = SignupViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func setupUI(){
            
        view.backgroundColor = .white
        animationView = .init(name: "tea-cup")
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
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        view.addSubview(emailTextFields)
        
        emailTextFields.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(passwordTextFields)
        
        passwordTextFields.snp.makeConstraints { make in
            make.top.equalTo(emailTextFields.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(loginButton)
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFields.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(alreadyRegisterButton)
        
        alreadyRegisterButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(70)
        }
        
        view.addSubview(alreadyLoginButton)
        
        alreadyLoginButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(180)
            make.trailing.equalTo(60)
        }
        
        view.addSubview(forgotButton)
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(alreadyRegisterButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }

    }
}

