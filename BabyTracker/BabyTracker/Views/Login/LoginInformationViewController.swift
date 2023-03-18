//
//  LoginInformationViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 15.03.2023.
//

//FIXME: -
// CoreData'ya veri kaydet
// Klavye etkinliklerini kontrol et ve en alttaki textfield klavye ile yukarı kaysın.
// Continue button'un aktif ve pasif etkinliklerini yap

import UIKit
import SnapKit
import CoreData

final class LoginInformationViewController: UIViewController {
    //MARK: - Properties
    private var formModel = FormModel()
    var formIsNewValid = false
    var isChild: Bool?
    private var profileImage: UIImage?
    lazy var plusPhotoButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "btn_addphoto"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleProfilePhotoSelected), for: .touchUpInside)
        return button
    }()
    lazy var backgroundView: UIView = {
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        bgView.layer.cornerRadius = 25
        bgView.backgroundColor = .white
        bgView.layer.shadowOpacity = 0.1
        bgView.layer.shadowOffset = .zero
        bgView.layer.shadowRadius = 5
        return bgView
    }()
    lazy var boyBabyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_boy")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_boy")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleBoyBabyButton), for: UIControl.Event.touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var girlBabyButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "img_unselected_girl")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.normal)
        button.setImage(UIImage(named: "img_selected_girl")?.withRenderingMode(.alwaysOriginal), for: UIControl.State.selected)
        button.addTarget(self, action: #selector(handleGirlBabyButton), for: UIControl.Event.touchUpInside)

        button.contentMode = .scaleAspectFit
        return button
    }()
    lazy var babyFullNameTextField: CustomTextField = {
      let textField = CustomTextField()
        textField.placeholder = "Baby Full Name"
        textField.contentMode = .left
        return textField
    }()
    lazy var birthDateTextField: CustomTextField = {
      let textField = CustomTextField()
        textField.placeholder = "Birth Data"
        textField.contentMode = .left
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(valueChangedPicker), for: .valueChanged)
        return textField
    }()
    lazy var timeofBirthTextField: CustomTextField = {
      let textField = CustomTextField()
        textField.placeholder = "Time Of Birth"
        textField.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(valueChangedTimeOfBirthPicker), for: .valueChanged)
        return textField
    }()
    lazy var dueDateTextField: CustomTextField = {
      let textField = CustomTextField()
        textField.placeholder = "Due Date"
        textField.contentMode = .left
        let datePickerTime = UIDatePicker()
        datePickerTime.datePickerMode = .time
        datePickerTime.preferredDatePickerStyle = .wheels
        datePickerTime.frame.size = CGSize(width: 0, height: 250)
        textField.inputView = datePickerTime
        datePickerTime.addTarget(self, action: #selector(valueChangedDueDateTextFieldPicker), for: .valueChanged)
        return textField
    }()
    lazy var continueButton: CustomButton = {
        let button = CustomButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(UIColor.white,for: .normal)
        button.isEnabled = true
        button.addTarget(self, action: #selector(handleContinueButton), for: .touchUpInside)
        return button
    }()
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationItem.hidesBackButton = true
        setupLoginUI()
        hideKeyboardWhenTappedAround()
        checkFormStatus()
        formIsNewValid = false
    }
    //MARK: - Helpers
    func setupLoginUI(){
        view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(134)
            make.width.equalTo(134)
            make.centerX.equalToSuperview()
        }
        view.addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.top.equalTo(plusPhotoButton.snp.bottom).offset(50)
            make.centerX.equalTo(view.center)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
        }
        view.addSubview(girlBabyButton)
        girlBabyButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(24)
            make.left.equalTo(plusPhotoButton.snp.left)
            make.height.equalTo(42)
            make.width.equalTo(42)
        }
        view.addSubview(boyBabyButton)
        boyBabyButton.snp.makeConstraints { make in
            make.top.equalTo(backgroundView.snp.top).offset(24)
            make.right.equalTo(plusPhotoButton.snp.right)
            make.height.equalTo(42)
            make.width.equalTo(42)
        }
        
        let stackTextField = UIStackView(arrangedSubviews: [babyFullNameTextField, birthDateTextField, timeofBirthTextField, dueDateTextField])
        stackTextField.axis = .vertical
        stackTextField.distribution = .fillEqually
        stackTextField.spacing = 10
        
        view.addSubview(continueButton)
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(40)
            make.height.equalTo(continueButton.snp.width).multipliedBy(0.18)
        }
        
        view.addSubview(stackTextField)
        stackTextField.snp.makeConstraints { make in
            make.top.equalTo(girlBabyButton.snp.bottom).offset(25)
            make.right.equalToSuperview().inset(40)
            make.left.equalToSuperview().offset(40)
            make.bottom.equalTo(continueButton.snp.top).offset(-20)
        }
    }
    //MARK: - Actions
    
    //Girl and Boy button is selected func
    
    // FIXME: - FormIs dont working
    
//    @objc func textDidChange(sender: UITextField) {
//        if sender == babyFullNameTextField {
//            formModel.babyFullName = sender.text
//        } else if sender == birthDateTextField {
//            formModel.birthDate = sender.text
//        } else if sender == timeofBirthTextField {
//            formModel.timeOfBirth = sender.text
//        } else if sender == dueDateTextField {
//            formModel.dueDate = sender.text
//        }
//        checkFormStatus()
//        print(formModel.formIsValid)
//    }
    
    //FIXME: - DONT WORKING
    @objc func textDidChange(sender: UITextField) {
        if babyFullNameTextField.text!.isEmpty || birthDateTextField.text!.isEmpty || timeofBirthTextField.text!.isEmpty || dueDateTextField.text!.isEmpty {
            formIsNewValid = false
        } else {
            formIsNewValid = true
        }
    }
    
    @objc func handleContinueButton(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        
        //Save core data
        saveData.setValue(babyFullNameTextField.text!, forKey: "babyFullName")
        saveData.setValue(String(birthDateTextField.text!), forKey: "birthDate")
        saveData.setValue(String(timeofBirthTextField.text!), forKey: "timeOfBirth")
        saveData.setValue(isChild.self, forKey: "isGirl")
        saveData.setValue(String(dueDateTextField.text!), forKey: "dueDate")
        
        let imagePress = plusPhotoButton.currentImage?.jpegData(compressionQuality: 0.5)
        saveData.setValue(imagePress, forKey: "profileImage")
        //saveData.setValue(UUID(), forKey: "id")
        
//        if let ages = Int(ageTextField.text!){
//            saveData.setValue(ages, forKey: "age")
//        }
        
        do {
            try context.save()
            print("kaydedili karsimmmmm")
        } catch {
            print("hatasız kul olmaz kardes")
        }
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleGirlBabyButton(){
        if girlBabyButton.isSelected == true {
            girlBabyButton.isSelected = false
            isChild = false
        } else {
            girlBabyButton.isSelected = true
            isChild = true
            boyBabyButton.isSelected = false
        }
    }
    @objc func handleBoyBabyButton(){
        if boyBabyButton.isSelected == true {
            boyBabyButton.isSelected = false
            isChild = false
        } else {
            boyBabyButton.isSelected = true
            isChild = true
            girlBabyButton.isSelected = false
        }
    }
    
    @objc func valueChangedTimeOfBirthPicker(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.timeofBirthTextField.text = datePickerTime.string(from: sender.date)
    }
    
    @objc func valueChangedDueDateTextFieldPicker(sender: UIDatePicker){
        let datePickerTime = DateFormatter()
        datePickerTime.dateStyle = .none
        datePickerTime.timeStyle = .long
        datePickerTime.dateFormat = "HH:mm a"
        self.dueDateTextField.text = datePickerTime.string(from: sender.date)
    }
    
    @objc func valueChangedPicker(sender: UIDatePicker){
        let dateFormat = DateFormatter()
        dateFormat.dateStyle = .long
        dateFormat.timeStyle = .none
        dateFormat.dateFormat = "dd.MM.yyyy"
        self.birthDateTextField.text = dateFormat.string(from: sender.date)
    }
    
    @objc func handleProfilePhotoSelected(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
}

//MARK: - Extensions

// MARK: - UpdateFormProtocol
extension LoginInformationViewController: FormControllerProtocol {
func checkFormStatus() {
    if formModel.formIsValid {
        continueButton.isEnabled = true
        continueButton.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    } else {
        continueButton.isEnabled = false
        continueButton.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
    }
}
}

//MARK: - UIImagePickerControllerDelegate

extension LoginInformationViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
//Closed Keyboard
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
