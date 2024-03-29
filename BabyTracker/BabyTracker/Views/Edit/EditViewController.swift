//
//  EditViewController.swift
//  BabyTracker
//
//  Created by Mehmet Arıkan on 16.03.2023.
//

//FIXME: -

// CoreDatadaki verileri id'siz tutuyorum. Bundan dolayı edit sayfasındaki save butonu ile veriyi yeni veri olarak kaydetmiş oluyorum. id ekle bunu fixle
// Klavye etkinliklerini kontrol et ve en alttaki textfield klavye ile yukarı kaysın.
// Save button'un aktif ve pasif etkinliklerini yap
// lottie ile loading ekle
// Save sonrası saved göster

import UIKit
import SnapKit
import CoreData

final class EditViewController: UIViewController {
    //MARK: - Properties
    private var formModel = FormModel()
    var formIsNewValid = false
    private var profileImage: UIImage?
    var isChild: Bool?
    lazy var plusPhotoButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(named: "btn_addphoto-1"), for: .normal)
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
    lazy var continueButton = CustomButton(title: "Continue")
    
    //MARK: - Lifeycle
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginUI()
        hideKeyboardWhenTappedAround()
        checkFormStatus()
        formIsNewValid = false
        fetchData()
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal), style: .done, target: self, action: #selector(backButtonHome))
    }
    //MARK: - Helpers
    func setupLoginUI(){
        continueButton.addTarget(self, action: #selector(handleSaveButton), for: .touchUpInside)
        view.backgroundColor = .white
        view.addSubview(plusPhotoButton)
        plusPhotoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
            make.height.equalTo(134)
            make.width.equalTo(134)
            make.centerX.equalToSuperview()
        }
        plusPhotoButton.layer.cornerRadius = 134/2
        plusPhotoButton.clipsToBounds = true
        plusPhotoButton.contentMode = .scaleAspectFill
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
    
    func fetchData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do{
            let results = try context.fetch(fetchRequest)
            for result in results as! [NSManagedObject] {
                if let name = result.value(forKey: "babyFullName") as? String {
                    babyFullNameTextField.text = name
                }
                if let childSelected = result.value(forKey: "isGirl") as? Bool {
                    print(childSelected)
                    if childSelected == false{
                        girlBabyButton.isSelected = true
                        boyBabyButton.isSelected = false
                    } else {
                        boyBabyButton.isSelected = true
                        girlBabyButton.isSelected = false
                    }
                }
                if let profileImageFetch = result.value(forKey: "profileImage") as? Data {
                    plusPhotoButton.setImage(UIImage(data: profileImageFetch), for: .normal)
                }
                if let birth = result.value(forKey: "birthDate") as? String {
                    birthDateTextField.text = birth
                }
                if let time = result.value(forKey: "timeOfBirth") as? String {
                    timeofBirthTextField.text = time
                }
                if let due = result.value(forKey: "dueDate") as? String {
                    dueDateTextField.text = due
                }
            }
        } catch {
            print("catche yakalandın ve düştü kardeşim - fetch data")
        }
    }
    
    @objc func backButtonHome(){
        navigationController?.popViewController(animated: true)
    }

    
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
    
    @objc func handleBack(){
        navigationController?.pushViewController(HomeViewController(), animated: true)
    }
    
    @objc func handleSaveButton(){
        
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
            
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "newData"), object: nil)
            let vc = HomeViewController()
            navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @objc func handleGirlBabyButton(){
        if girlBabyButton.isSelected == true {
            girlBabyButton.isSelected = false
            isChild = false
        } else {
            girlBabyButton.isSelected = true
            boyBabyButton.isSelected = false
            isChild = true
        }
    }
    
    @objc func handleBoyBabyButton(){
        if boyBabyButton.isSelected == true {
            boyBabyButton.isSelected = false
            isChild = false
        } else {
            boyBabyButton.isSelected = true
            girlBabyButton.isSelected = false
            isChild = true
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
    
    //FIXME: - FormCheck  //PROTOCOL
//        if formIsNewValid {
//            continueButton.isEnabled = true
//            continueButton.backgroundColor = .purple
//            print("purple")
//        } else {
//            continueButton.isEnabled = false
//            continueButton.backgroundColor = .gray
//            print("gray")
//        }
    
}

//MARK: - Extensions

// MARK: - UpdateFormProtocol
extension EditViewController: FormControllerProtocol {
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

extension EditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
