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

protocol AuthenticationDelegate: AnyObject {
    func authenticationDidComplete()
}

final class LoginViewController: UIViewController {
    
    weak var delegate: AuthenticationDelegate?
    
    //MARK: Properties
    private var viewModel = LoginViewModel()
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
        text.autocapitalizationType = .none
        text.autocorrectionType = .no
        text.keyboardType = .emailAddress
        text.layer.cornerRadius = 10
        return text
    }()
    lazy var passwordTextFields: UITextField = {
       var text = UITextField()
        text.placeholder = "Enter password"
        text.textColor = .systemGray
        text.textAlignment = .left
        text.autocapitalizationType = .none
        text.autocorrectionType = .no
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 10
        text.isSecureTextEntry = true
        return text
    }()
    lazy var loginButton: UIButton = {
        var button = UIButton()
        button.setTitle("Login", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 10
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginPress), for: .touchUpInside)
        return button
    }()
    lazy var alreadyRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Sign up with account? ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.black])
        attributedTitle.append(NSAttributedString(string: "Sign Up",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedTitle, for: .normal)
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
        configureNotificationObservers()
        
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextFields {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        updateForm()
    }
    
    @objc func forgotPress(){
        let vc = ForgotPasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
        }
    
    @objc func loginPress() {
        guard let email = emailTextFields.text else { return }
        guard let password = passwordTextFields.text else { return }
        
        AuthService.logUserIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            //self.delegate?.authenticationDidComplete()
            self.dismiss(animated: true, completion: nil)
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
        
        view.addSubview(forgotButton)
        
        forgotButton.snp.makeConstraints { make in
            make.top.equalTo(alreadyRegisterButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
    }
    
    func configureNotificationObservers() {
        emailTextFields.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextFields.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

//MARK: - FormViewModel

extension LoginViewController: FormViewModel {
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        loginButton.isEnabled = viewModel.formIsValid
    }
}
