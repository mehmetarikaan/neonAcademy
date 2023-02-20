//
//  ViewController.swift
//  LottieChallange
//
//  Created by Mehmet Arıkan on 20.02.2023.
//

import UIKit
import SnapKit
import Lottie

class ViewController: UIViewController {
    lazy var image: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "war")
        image.contentMode = .scaleAspectFit
        return image
    }()
    lazy var startedButton: UIButton = {
        let start = UIButton()
        start.setTitle("Start", for: .normal)
        start.backgroundColor = .purple
        start.layer.cornerRadius = 20
        start.addTarget(self, action: #selector(started), for: .touchUpInside)
        return start
    }()
    lazy var stoppedButton: UIButton = {
        let start = UIButton()
        start.setTitle("Stop", for: .normal)
        start.backgroundColor = .systemRed
        start.layer.cornerRadius = 20
        start.addTarget(self, action: #selector(stopped), for: .touchUpInside)
        return start
    }()
    
    private var animationView: LottieAnimationView!
    private var animationLoad: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnimationView()
    }
    
    func setupAnimationView(){
        
        view.backgroundColor = .white
        animationView = .init(name: "blur")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.animationSpeed = 1.0
        
        
        animationView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }
        
        //
        
        animationLoad = .init(name: "loading")
        animationLoad.frame = view.frame
        animationLoad.contentMode = .scaleAspectFit
        animationLoad.loopMode = .loop
        view.addSubview(animationLoad)
        animationLoad.animationSpeed = 1.0
        
        animationLoad.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(64)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(300)
        }

    }
    
    func setupUI(){
        view.addSubview(image)
        view.addSubview(startedButton)
        view.addSubview(stoppedButton)
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().inset(10)
            make.height.equalTo(300)
        }
        
        startedButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(80)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }
        
        stoppedButton.snp.makeConstraints { make in
            make.top.equalTo(startedButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().inset(30)
        }

        
    }
    
    @objc func started(){
        animationView.play()
        animationLoad.play()
    }
    
    @objc func stopped(){
        animationView.stop()
        animationLoad.stop()
    }

}

