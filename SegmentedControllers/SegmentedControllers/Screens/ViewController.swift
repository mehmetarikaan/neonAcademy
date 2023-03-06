//
//  ViewController.swift
//  SegmentedControllers
//
//  Created by Mehmet Arıkan on 14.02.2023.
//

// dönüşte ekle

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIDesign()
    }
    func setupUIDesign() {
        let segmentedControl: UISegmentedControl = {
            let segmented = UISegmentedControl(items: ["Neon Academy 2023", "Neon", "Apps"])
            segmented.selectedSegmentIndex = 0
            segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: .normal)
            segmented.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.purple], for: .selected)
            segmented.tintColor = .red
            segmented.translatesAutoresizingMaskIntoConstraints = false
            segmented.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
            segmented.isMomentary = false
            return segmented
        }()
        view.addSubview(segmentedControl)
        segmentedControl.backgroundColor = .systemGray4
        segmentedControl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(300)
            make.height.equalTo(40)
        }
    }
    
    @objc func handleSegmentChange(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            sender.frame.size.width = 200
            sender.selectedSegmentTintColor = .systemPurple
            view.backgroundColor = .white
            sender.setWidth(screenWidth/3, forSegmentAt: 0)
            sender.setWidth(screenWidth/4, forSegmentAt: 1)
            sender.setWidth(screenWidth/4, forSegmentAt: 2)
            
        case 1:
            sender.frame.size.width = 200
            sender.selectedSegmentTintColor = .systemGreen
            view.backgroundColor = .systemPurple
            sender.setWidth(screenWidth/3.5, forSegmentAt: 1)
            sender.setWidth(screenWidth/4, forSegmentAt: 0)
            sender.setWidth(screenWidth/4, forSegmentAt: 2)
        case 2:
            sender.frame.size.width = 200
            sender.selectedSegmentTintColor = .systemCyan
            view.backgroundColor = .green
            sender.setWidth(screenWidth/3.9, forSegmentAt: 2)
            sender.setWidth(screenWidth/4, forSegmentAt: 0)
            sender.setWidth(screenWidth/4, forSegmentAt: 1)
        default:
            
            break
        }
    }
}


