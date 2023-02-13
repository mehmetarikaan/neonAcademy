//
//  ViewController.swift
//  CGRectComedyClubApp
//
//  Created by Mehmet Arıkan on 10.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var bigView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.1).cgColor
        return view
    }()
    
    lazy var imageTitle: UILabel = {
        let imageTitle = UILabel()
        imageTitle.text = "01.03.2023   -    21.00"
        imageTitle.font = UIFont(name: "Marker Felt", size: 20)
        imageTitle.textAlignment = .center
        imageTitle.textColor = .white
        
        return imageTitle
    }()
    
    lazy var imageTitleTwo: UILabel = {
        let imageTitle = UILabel()
        imageTitle.text = "01.03.2023   -    21.00"
        imageTitle.font = UIFont(name: "Marker Felt", size: 20)
        imageTitle.textAlignment = .center
        imageTitle.textColor = .white
        
        return imageTitle
    }()
    
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Neon Comedy Club"
        titleLabel.font = UIFont(name: "Marker Felt", size: 20)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    
    lazy var smallView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.opacity = 0.2
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "comedy.jpeg"))
        image.sizeToFit()
        return image
    }()
    
    lazy var smallViewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray
        view.layer.opacity = 0.2
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.white.withAlphaComponent(0.5).cgColor
        return view
    }()
    
    lazy var imageViewTwo: UIImageView = {
        let image = UIImageView(image: UIImage(named: "comedy.jpeg"))
        image.sizeToFit()
        return image
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        view.addSubview(bigView)
        view.addSubview(titleLabel)
        bigView.addSubview(imageView)
        imageView.addSubview(smallView)
        bigView.addSubview(imageViewTwo)
        imageViewTwo.addSubview(smallViewTwo)
        imageView.addSubview(imageTitle)
        imageViewTwo.addSubview(imageTitleTwo)
        
    }
    
    func configure(){
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        bigView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        titleLabel.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight/5)
        imageView.frame = CGRect(x: 0, y: 110, width: screenWidth, height: screenHeight/4)
        imageTitle.frame = CGRect(x: 0, y: 140, width: screenWidth, height: screenHeight/4)
        imageTitleTwo.frame = CGRect(x: 0, y: 140, width: screenWidth, height: screenHeight/4)
        smallView.frame = CGRect(x: 0, y: 210, width: screenWidth, height: screenHeight/12)
        imageViewTwo.frame = CGRect(x: 0, y: 430, width: screenWidth, height: screenHeight/4)
        smallViewTwo.frame = CGRect(x: 0, y: 210, width: screenWidth, height: screenHeight/12)

        
    }
    
    
}

