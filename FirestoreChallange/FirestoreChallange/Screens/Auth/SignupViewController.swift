//
//  ViewController.swift
//  FirebaseAuthenticationChallange
//
//  Created by Mehmet Arıkan on 23.02.2023.
//

import UIKit
import Lottie
import SnapKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {
    //MARK: - Properties
    private var animationView: LottieAnimationView!
    private var viewModel = RegistrationViewModel()
    private var profileImage: UIImage?
    
    
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Sign up"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    lazy var plusPhotoButton: UIButton = {
        var button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .purple
        button.addTarget(self, action: #selector(handleProfilePhotoSelected), for: .touchUpInside)
        return button
    }()
    
    lazy var emailTextFields: UITextField = {
       var text = UITextField()
        text.placeholder = "Enter email"
        text.textColor = .systemGray
        text.textAlignment = .left
        text.autocapitalizationType = .none
        text.autocorrectionType = .no
        text.borderStyle = .roundedRect
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
    
    lazy var userNameTextFields: UITextField = {
       var text = UITextField()
        text.placeholder = "Enter username"
        text.textColor = .systemGray
        text.textAlignment = .left
        text.autocapitalizationType = .none
        text.autocorrectionType = .no
        text.borderStyle = .roundedRect
        text.layer.cornerRadius = 10
        return text
    }()

    lazy var signinButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sign in", for: .normal)
        button.tintColor = .white
        button.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        button.layer.cornerRadius = 10
        button.isEnabled = true
        button.addTarget(self, action: #selector(signinPress), for: .touchUpInside)
        return button
    }()
    lazy var alreadyRegisterButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Have you registered before? ",
                                                        attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                     .foregroundColor: UIColor.black])
        attributedTitle.append(NSAttributedString(string: "Login",
                                                  attributes: [.font: UIFont.boldSystemFont(ofSize: 16),
                                                               .foregroundColor: UIColor.black]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(toLoginPress), for: .touchUpInside)
        return button
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        configureNotificationObservers()
        navigationController?.isNavigationBarHidden = true
        
    }
    
    //MARK: - Actions
    @objc func handleProfilePhotoSelected(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc func textDidChange(sender: UITextField){
        if sender == emailTextFields {
            viewModel.email = sender.text
        } else if sender == passwordTextFields {
            viewModel.password = sender.text
        } else if sender == userNameTextFields {
            viewModel.username = sender.text
        }
        updateForm()
    }
    
    @objc func signinPress() {
        guard let email = emailTextFields.text else { return }
        guard let password = passwordTextFields.text else { return }
        guard let username = userNameTextFields.text?.lowercased() else { return }
        guard let profileImage = self.profileImage else { return }
        
        let credentials = AuthCredentials(email: email, password: password, username: username, profileImage: profileImage)
        AuthService.registerUser(withCredential: credentials) { error in
            if let error = error {
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true)
        }
    }
    
    @objc func toLoginPress(){
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Helpers
    func setupUI(){
        
        view.backgroundColor = .white
        animationView = .init(name: "singing-contract")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.animationSpeed = 1.0
        animationView.play()
    
        animationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(250)
        }

        
        view.addSubview(labelTitle)
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp_centerXWithinMargins)
            make.height.equalTo(150)
            make.width.equalTo(150)
        }
        
        view.addSubview(emailTextFields)
        
        emailTextFields.snp.makeConstraints { make in
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(passwordTextFields)
        
        passwordTextFields.snp.makeConstraints { make in
            make.top.equalTo(emailTextFields.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(userNameTextFields)
        
        userNameTextFields.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFields.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }

        
        view.addSubview(signinButton)
        
        signinButton.snp.makeConstraints { make in
            make.top.equalTo(userNameTextFields.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(50)
            make.trailing.equalToSuperview().inset(50)
        }
        
        view.addSubview(alreadyRegisterButton)
        
        alreadyRegisterButton.snp.makeConstraints { make in
            make.top.equalTo(signinButton.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(70)
        }

    }
    func configureNotificationObservers() {
        emailTextFields.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextFields.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        userNameTextFields.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
}

//MARK: - FormViewModel

extension SignupViewController: FormViewModel {
    func updateForm() {
        signinButton.backgroundColor = viewModel.buttonBackgroundColor
        signinButton.setTitleColor(viewModel.buttonTitleColor, for: .normal)
        signinButton.isEnabled = viewModel.formIsValid
    }
}

//MARK: - UIImagePickerControllerDelegate

extension SignupViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.editedImage] as? UIImage else { return }
        
        profileImage = selectedImage
        
        plusPhotoButton.setImage(selectedImage.withRenderingMode(.alwaysOriginal), for: .normal)
        plusPhotoButton.layer.borderColor = UIColor.white.cgColor
        plusPhotoButton.layer.masksToBounds = true
        plusPhotoButton.layer.borderWidth = 2
        plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
        
        self.dismiss(animated: true, completion: nil)

    }
}
