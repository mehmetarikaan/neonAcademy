//
//  ViewController.swift
//  UIViewAnimationsChallenge
//
//  Created by Mehmet Arıkan on 1.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    lazy var showButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Show", for: .normal)
        button.backgroundColor = .systemOrange
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleShow), for: .touchUpInside)
        return button
    }()
    
    lazy var hideButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Hide", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleHide), for: .touchUpInside)
        return button
    }()
    
    lazy var animateShowView: UIView = {
        var viewAnimate = UIView()
        viewAnimate.backgroundColor = .red
        return viewAnimate
    }()
    
    // Second Task UI
    
    lazy var leftButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Turn Right", for: .normal)
        button.backgroundColor = .systemRed
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleRight), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Turn Left", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleLeft), for: .touchUpInside)
        return button
    }()
    
    private let vikingsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "vikings")
        return image
    }()
    
    // Third TASK
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.text = "Mehmet Arıkan"
        label.textColor = .black
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    lazy var upperButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Up Label", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleUpper), for: .touchUpInside)
        return button
    }()
    
    lazy var lowerButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Low Label", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleLower), for: .touchUpInside)
        return button
    }()
    
    // Four Task
    
    private let sizeView: UIView = {
        let firstView = UIView()
        firstView.backgroundColor = .systemCyan
        firstView.layer.cornerRadius = 12
        return firstView
    }()
    
    lazy var smallingButton: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Small View", for: .normal)
        button.backgroundColor = .systemPink
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(handleSmall), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifeycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - CreateUI - SetupUI
    func setupUI(){
        view.backgroundColor = .white
        
        view.addSubview(showButton)
        showButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.leading.equalToSuperview().offset(60)
            make.width.equalTo(120)
            //make.centerX.equalTo(view.center)
        }
        
        view.addSubview(hideButton)
        hideButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.trailing.equalToSuperview().inset(60)
            make.width.equalTo(120)
            //make.centerX.equalTo(view.center)
        }
        view.addSubview(animateShowView)
        animateShowView.snp.makeConstraints { make in
            make.top.equalTo(hideButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(90)
            make.width.equalTo(200)
        }
        
        view.addSubview(rightButton)
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(animateShowView.snp.top).offset(120)
            make.leading.equalToSuperview().offset(60)
            make.width.equalTo(120)
            //make.centerX.equalTo(view.center)
        }
        
        view.addSubview(leftButton)
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(animateShowView.snp.top).offset(120)
            make.trailing.equalToSuperview().inset(60)
            make.width.equalTo(120)
            //make.centerX.equalTo(view.center)
        }
        view.addSubview(vikingsImage)
        vikingsImage.snp.makeConstraints { make in
            make.top.equalTo(leftButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.center)
            make.height.equalTo(120)
            make.width.equalTo(150)
        }
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(vikingsImage.snp.bottom).offset(60)
            make.centerX.equalTo(view.center)
        }
        
        view.addSubview(upperButton)
        upperButton.snp.makeConstraints { make in
            make.top.equalTo(vikingsImage.snp.bottom).offset(120)
            make.width.equalTo(120)
            make.centerX.equalTo(view.center)
        }
        view.addSubview(lowerButton)
        lowerButton.snp.makeConstraints { make in
            make.top.equalTo(upperButton.snp.bottom).offset(20)
            make.width.equalTo(120)
            make.centerX.equalTo(view.center)
        }
        view.addSubview(smallingButton)
        smallingButton.snp.makeConstraints { make in
            make.top.equalTo(lowerButton.snp.bottom).offset(20)
            make.centerX.equalTo(view.center)
            make.width.equalTo(120)
        }
        view.addSubview(sizeView)
        sizeView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(30)
            make.centerX.equalTo(view.center)
            make.height.equalTo(200)
            make.width.equalTo(200)
        }
    }
    
        
    //MARK: - Actions
    
    @objc func handleHide(){
        UIView.animate(withDuration: 5) {
            self.animateShowView.snp.updateConstraints { make in
                make.top.equalTo(self.hideButton.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(40)
                make.trailing.equalToSuperview().inset(40)
                make.height.equalTo(0)
                make.width.equalTo(0)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func handleShow(){
        UIView.animate(withDuration: 5) {
            self.animateShowView.snp.updateConstraints { make in
                make.top.equalTo(self.hideButton.snp.bottom).offset(20)
                make.leading.equalToSuperview().offset(40)
                make.trailing.equalToSuperview().inset(40)
                make.height.equalTo(90)
                make.width.equalTo(200)
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @objc func handleRight(){
        vikingsImage.rotateRight()
    }
    
    @objc func handleLeft(){
        vikingsImage.rotateLeft()
    }
    @objc func handleUpper(){
        UIView.animate(withDuration: 5) { [self] in
            self.titleLabel.snp.remakeConstraints { make in
                make.top.equalTo(self.vikingsImage.snp.bottom).offset(20)
                make.centerX.equalTo(view.center)
            }
            self.view.layoutIfNeeded()
        }
    }
    @objc func handleLower(){
        UIView.animate(withDuration: 5) { [self] in
            self.titleLabel.snp.remakeConstraints { make in
                make.top.equalTo(self.vikingsImage.snp.bottom).offset(60)
                make.centerX.equalTo(view.center)
            }
            self.view.layoutIfNeeded()
        }
    }
    @objc func handleSmall(){
        UIView.animate(withDuration: 5) {
            self.sizeView.snp.remakeConstraints { make in
                make.bottom.equalToSuperview().inset(30)
                make.centerX.equalTo(self.view.center)
                make.height.equalTo(50)
                make.width.equalTo(50)
            }
            self.view.layoutIfNeeded()
        }
    }
}

//MARK: - Extensions
extension UIView{
    func rotateRight() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
    func rotateLeft() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.y")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 1
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
