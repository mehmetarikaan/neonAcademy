//
//  MainVC.swift
//  RevenueChallenge
//
//  Created by Mehmet Arıkan on 9.03.2023.
//

import UIKit
import SnapKit
import Lottie

class MainVC: UIViewController {
    private var animationView: LottieAnimationView!
    lazy var labelTitle: UILabel = {
        var label = UILabel()
        label.text = "Per Month Price $19.99"
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont(name: "Marker Felt", size: 32)
        return label
    }()
    
    lazy var saleButton: UIButton = {
        var button = UIButton()
        button.setTitle("Buy", for: .normal)
        button.backgroundColor = .systemOrange
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        
        //Lottie
        animationView = .init(name: "thanks")
        animationView.frame = view.frame
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        view.addSubview(animationView)
        animationView.animationSpeed = 1.0
        animationView.play()
    
        animationView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(5)
            make.centerX.equalTo(view.center)
            make.height.equalTo(300)
        }
        
        view.backgroundColor = .white
        view.addSubview(labelTitle)
        view.addSubview(saleButton)
        
        labelTitle.snp.makeConstraints { make in
            make.top.equalTo(animationView.snp.bottom).offset(20)
            make.centerX.equalTo(view.center)
        }
        saleButton.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(30)
            make.width.equalTo(200)
            make.height.equalTo(75)
            make.centerX.equalTo(view.center)
        }
    }

}
