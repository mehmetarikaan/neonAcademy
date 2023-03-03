//
//  ViewController.swift
//  PageControllChallange
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

// Ekle image vs 

//MARK: - FATAL
import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 3
        page.backgroundColor = .systemGray
        page.addTarget(ViewController.self, action: #selector(changePage), for: .valueChanged)
        return page
    }()
    
    lazy var viewZero: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        let label = UILabel()
        label.text = "View Zero, say to hellooo!"
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }()
    
    lazy var viewOne: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        let label = UILabel()
        label.text = "View One, say to hellooo!"
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }()
    
    lazy var viewTwo: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        let label = UILabel()
        label.text = "View Two, say to hellooo!"
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }()
    
    lazy var views = [viewZero, viewOne, viewTwo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        setupUI()
    }
    @objc func changePage(_ sender: UIPageControl){
        switch sender.currentPage {
        case 0:
            self.view.backgroundColor = .systemRed
        case 1:
            self.view.backgroundColor = .systemBlue
        case 2:
            self.view.backgroundColor = .systemGreen
        default:
            self.view.backgroundColor = .systemPink
        }
    }
    
    func setupUI(){
        view.addSubview(pageControl)
        pageControl.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            //make.centerY.equalToSuperview()
        }
    }
}

