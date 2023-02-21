//
//  ViewController.swift
//  UIButtonsChallange
//
//  Created by Mehmet Arıkan on 13.02.2023.
//

import UIKit
import SnapKit
import AVFoundation

//FIXEDME: -- 

class ViewController: UIViewController {

    lazy var headerTitleOne: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Drop-Down Menu Button"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.layer.backgroundColor = UIColor.red.withAlphaComponent(0.2).cgColor
        return headerTitle
    }()
    
    lazy var buttonOne: UIButton = {
    let button = UIButton()
        button.setTitle("Hi, click me!", for: .normal)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 20
        
        button.addTarget(self, action: #selector(pressedButtonOne), for: .touchUpInside)
        
        return button
    }()
    //TWO
    lazy var headerTitleTwo: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Daily Specials Button"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.layer.backgroundColor = UIColor.blue.withAlphaComponent(0.2).cgColor
        return headerTitle
    }()
    
    lazy var buttonTwo: UIButton = {
    let button = UIButton()
        button.setBackgroundImage(UIImage(named: "bg-button"), for: .normal)
        button.setTitle("Daily Specials Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.backgroundColor = UIColor.red.cgColor
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 5, height: 5)
        button.layer.shadowRadius = 5
        button.layer.shadowOpacity = 0.5
        button.alpha = 0.5
        
        button.addTarget(self, action: #selector(pressedButtonTwo), for: .touchUpInside)
        
        return button
    }()
    // THREE
    lazy var headerTitleThree: UILabel = {
        let headerTitle = UILabel()
        headerTitle.text = "Three Task - Town's Vigilante Group"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.layer.backgroundColor = UIColor.purple.withAlphaComponent(0.5).cgColor
        return headerTitle
    }()
    
    lazy var buttonThree: UIButton = {
       let button = UIButton()
        button.setTitle("Hi, Clicked me!", for: .normal)
        button.backgroundColor = .purple
        button.tintColor = .purple
        button.addTarget(self, action: #selector(buttonTapped), for: .touchDown)
        button.addTarget(self, action: #selector(buttonBack), for: .touchUpInside)
        
        return button
          
    }()
    //FOR
    
    lazy var headerTitleFor: UILabel = {
       let headerTitle = UILabel()
        headerTitle.text = "For Task - Enables or Disables"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.layer.backgroundColor = UIColor.blue.withAlphaComponent(0.5).cgColor
        return headerTitle
    }()
    
    lazy var buttonFor: UIButton = {
        let button = UIButton()
        button.setTitle("Hi, I am disabled", for: .normal)
        button.backgroundColor = .blue
        button.tintColor = .blue
        button.addTarget(self, action: #selector(buttonForPressed), for: .touchUpInside)
        button.isHidden = false
        
        return button
    }()
    //Five
    
    lazy var headerTitleFive: UILabel = {
       let headerTitle = UILabel()
        headerTitle.text = "Five Task - Animations"
        headerTitle.textColor = .white
        headerTitle.textAlignment = .center
        headerTitle.layer.backgroundColor = UIColor.green.withAlphaComponent(0.5).cgColor
        return headerTitle
    }()
    
    lazy var buttonFive: UIButton = {
        let button = UIButton()
        button.setTitle("Animations and Sounds", for: .normal)
        button.backgroundColor = .green
        button.tintColor = .green
        button.addTarget(self, action: #selector(buttonFivePressed), for: .touchUpInside)
        button.isHidden = false
        
        return button
    }()
    var player: AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        setupView()
        
    }
  
    func setupView() {
        //One
        view.addSubview(headerTitleOne)
        view.addSubview(buttonOne)
        //Two
        view.addSubview(headerTitleTwo)
        view.addSubview(buttonTwo)
        //Three
        view.addSubview(headerTitleThree)
        view.addSubview(buttonThree)
        //For
        view.addSubview(headerTitleFor)
        view.addSubview(buttonFor)
        //Five
        view.addSubview(headerTitleFive)
        view.addSubview(buttonFive)
        
        //One
        headerTitleOne.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.right.left.equalToSuperview()
        }
        
        buttonOne.snp.makeConstraints { make in
            make.top.equalTo(headerTitleOne).offset(40)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
        //Two
        headerTitleTwo.snp.makeConstraints { make in
            make.top.equalTo(buttonOne).offset(70)
            make.right.left.equalToSuperview()
        }
        
        buttonTwo.snp.makeConstraints { make in
            make.top.equalTo(headerTitleTwo).offset(40)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
        //Theree
        headerTitleThree.snp.makeConstraints { make in
            make.top.equalTo(buttonTwo).offset(70)
            make.right.left.equalToSuperview()
        }
        buttonThree.snp.makeConstraints { make in
            make.top.equalTo(headerTitleThree).offset(40)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
        //For
        headerTitleFor.snp.makeConstraints { make in
            make.top.equalTo(buttonThree).offset(70)
            make.right.left.equalToSuperview()
        }
        buttonFor.snp.makeConstraints { make in
            make.top.equalTo(headerTitleFor).offset(40)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
        //Five
        headerTitleFive.snp.makeConstraints { make in
            make.top.equalTo(buttonFor).offset(70)
            make.right.left.equalToSuperview()
        }
        buttonFive.snp.makeConstraints { make in
            make.top.equalTo(headerTitleFive).offset(40)
            make.height.equalTo(50)
            make.width.equalTo(20)
            make.right.equalTo(-80)
            make.left.equalTo(80)
        }
    }
    //MARK: - Player
    func playAuido(){
        let url = Bundle.main.url(forResource: "sound", withExtension: "mp3")
             
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
    }
    //MARK: - Button Target
    @objc func pressedButtonOne(){
        let controller = SherifViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc func pressedButtonTwo(){
        print("pressed")
    }
    @objc func buttonTapped(){
        buttonThree.backgroundColor = .yellow
    }
    
    @objc func buttonBack(){
        buttonThree.backgroundColor = .purple
    }
    @objc func buttonForPressed(){
        buttonFor.isHidden.toggle()
        print("pressed for")
    }
    @objc func buttonFivePressed(){
        self.view.shake()
        playAuido()
    }
}

