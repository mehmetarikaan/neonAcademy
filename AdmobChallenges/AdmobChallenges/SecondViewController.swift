//
//  SecondViewController.swift
//  AdmobChallenges
//
//  Created by Mehmet Arıkan on 7.03.2023.
//

import GoogleMobileAds
import UIKit
import SnapKit

class SecondViewController: UIViewController, GADFullScreenContentDelegate {
    
    private var interstitial: GADInterstitialAd?
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show ads", for: .normal)
        button.titleLabel?.textColor = .white
        button.backgroundColor = .systemOrange
        button.addTarget(self, action: #selector(handleRewardedButton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
            if let error = error {
                print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                return
            }
            interstitial = ad
            interstitial?.fullScreenContentDelegate = self
        }
        )
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: {
            self.interstitial!.present(fromRootViewController: self)
        })
        
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalTo(view.center)
            make.height.equalTo(75)
            make.width.equalTo(120)
        }
       
    }
    @objc func handleRewardedButton(){
        let vc = RewardedViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
      print("Ad did fail to present full screen content.")
    }

    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad will present full screen content.")
    }

    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
      print("Ad did dismiss full screen content.")
    }
    
    @IBAction func doSomething(_ sender: Any) {
      if interstitial != nil {
          interstitial!.present(fromRootViewController: self)
      } else {
        print("Ad wasn't ready")
      }
    }

}
