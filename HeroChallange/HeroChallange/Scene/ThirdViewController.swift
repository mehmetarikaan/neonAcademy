//
//  ThirdViewController.swift
//  HeroChallange
//
//  Created by Mehmet Arıkan on 21.02.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    lazy var labirentView: UIImageView = {
        let labirent = UIImageView()
        labirent.image = UIImage(named: "labirent")
        return labirent
    }()
    lazy var imageMe: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mehmet")
        return image
    }()
    lazy var buttonUp: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.up.circle.fill"), for: .normal)
        button.tintColor = .purple
        button.titleLabel?.backgroundColor = .purple
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(upPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonDown: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.down.circle.fill"), for: .normal)
        button.tintColor = .purple
        button.titleLabel?.backgroundColor = .purple
        button.addTarget(self, action: #selector(downPressed), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    lazy var buttonLeft: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.left.circle.fill"), for: .normal)
        button.tintColor = .purple
        button.titleLabel?.backgroundColor = .purple
        button.addTarget(self, action: #selector(leftPressed), for: .touchUpInside)
        
        return button
    }()
    
    lazy var buttonRight: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "arrow.right.circle.fill"), for: .normal)
        button.tintColor = .purple
        button.titleLabel?.backgroundColor = .purple
        button.addTarget(self, action: #selector(rightPressed), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFit
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        self.hero.isEnabled = true
        labirentView.hero.id = "labirent"
        imageMe.hero.id = "imageMe"
        self.navigationController?.hero.navigationAnimationType = .slide(direction: .down)
    }
    
    func setupUI(){
        view.backgroundColor = .white
        view.addSubview(labirentView)
        
        labirentView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(30)
            make.leading.equalToSuperview().offset(30)
            make.height.equalTo(300)
        }
        
        view.addSubview(imageMe)
        
        imageMe.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(330)
            make.trailing.equalToSuperview().inset(40)
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        
        view.addSubview(buttonUp)
        
        buttonUp.snp.makeConstraints { make in
            make.top.equalTo(labirentView.snp.bottom).offset(100)
            make.leading.equalToSuperview().offset(200)
            make.trailing.equalToSuperview().inset(200)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        view.addSubview(buttonDown)
        
        buttonDown.snp.makeConstraints { make in
            make.top.equalTo(buttonUp.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(200)
            make.trailing.equalToSuperview().inset(200)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        view.addSubview(buttonLeft)
        
        buttonLeft.snp.makeConstraints { make in
            make.top.equalTo(labirentView.snp.bottom).offset(130)
            make.leading.equalToSuperview().offset(180)
            make.trailing.equalToSuperview().inset(220)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        
        view.addSubview(buttonRight)
        
        buttonRight.snp.makeConstraints { make in
            make.top.equalTo(labirentView.snp.bottom).offset(130)
            make.leading.equalToSuperview().offset(220)
            make.trailing.equalToSuperview().inset(240)
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
    }
    
    @objc func upPressed(){
        let nc = UINavigationController(rootViewController: ViewController())
        nc.hero.isEnabled = true
 self.navigationController?.pushViewController(ViewController(), animated: true)
    }
    
    @objc func downPressed(){

       
    }
    
    @objc func leftPressed(){
        let nc = UINavigationController(rootViewController: FourthViewController())
        nc.hero.isEnabled = true
 self.navigationController?.pushViewController(FourthViewController(), animated: true)
    }
    
    @objc func rightPressed(){
        print("right")
    }

}
