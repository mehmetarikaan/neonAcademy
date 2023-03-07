//
//  ViewController.swift
//  AdmobChallenges
//
//  Created by Mehmet Arıkan on 7.03.2023.
//

import GoogleMobileAds
import UIKit
import SnapKit

class ViewController: UIViewController, GADBannerViewDelegate {
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show ads", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(handleShowButton), for: .touchUpInside)
        return button
    }()
    
    let adSize = GADAdSizeFromCGSize(CGSize(width: 300, height: 50))
    
    var bannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalTo(view.center)
            make.height.equalTo(75)
            make.width.equalTo(120)
        }
        
        // In this case, we instantiate the banner with desired ad size.
        bannerView = GADBannerView(adSize: GADAdSizeBanner)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self
        
    }
    
    @objc func handleShowButton(){
        let vc = SecondViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        addBannerViewToView(bannerView)
        
        bannerView.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            bannerView.alpha = 1
        })
      print("bannerViewDidReceiveAd")
    }

    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
      print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }

    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
      print("bannerViewDidRecordImpression")
    }

    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillPresentScreen")
    }

    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewWillDIsmissScreen")
    }

    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
      print("bannerViewDidDismissScreen")
    }

    func addBannerViewToView(_ bannerView: GADBannerView) {
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bannerView)
        view.addConstraints(
            [NSLayoutConstraint(item: bannerView,
                                attribute: .bottom,
                                relatedBy: .equal,
                                toItem: view.safeAreaLayoutGuide,
                                attribute: .bottom,
                                multiplier: 1,
                                constant: 0),
             NSLayoutConstraint(item: bannerView,
                                attribute: .centerX,
                                relatedBy: .equal,
                                toItem: view,
                                attribute: .centerX,
                                multiplier: 1,
                                constant: 0)
            ])
    }
}
