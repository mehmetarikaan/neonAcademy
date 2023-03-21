
import UIKit
import SnapKit
import Lottie
import RevenueCat

class InAppVC: UIViewController {
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
        button.isHidden = true
        button.addTarget(self, action: #selector(didTapSaleButton), for: .touchUpInside)
        return button
    }()

    lazy var restoreButton: UIButton = {
        var button = UIButton()
        button.setTitle("Restore", for: .normal)
        button.backgroundColor = .systemOrange
        button.isHidden = true
        button.addTarget(self, action: #selector(didTapRestoreButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        createdButtonUI()
    }

    @objc private func didTapSaleButton(){
        fetchPackage { [weak self] package in
            self?.purchase(package: package)
        }
    }

    @objc private func didTapRestoreButton(){
        restorePurchases()
    }

    func createdButtonUI(){
        Purchases.shared.getCustomerInfo { [weak self] info, error in
            guard let info = info, error == nil else { return }
            print(info.entitlements)
            if info.entitlements.all["Premium"]?.isActive == true {
                let vc = MainVC()
                self?.navigationController?.pushViewController(vc, animated: true)
            } else {
                DispatchQueue.main.async {
                    self?.saleButton.isHidden = false
                    self?.restoreButton.isHidden = false
                }
            }
        }
    }

    func fetchPackage(completion: @escaping (RevenueCat.Package) -> Void ) {
        Purchases.shared.getOfferings { offerings, error in
            guard let offerings = offerings, error == nil else {
                return
            }
            guard let package = offerings.all.first?.value.availablePackages.first else {
                return
            }
            completion(package)
        }
    }

    func purchase(package: RevenueCat.Package) {
        Purchases.shared.purchase(package: package) { transaction, info, error, userCancelled in
            guard let transaction = transaction,
                  let info = info,
                  error == nil, !userCancelled else {
                return
            }
            if info.entitlements.all["Premium"]?.isActive == true {
                let vc = MainVC()
                self.navigationController?.pushViewController(vc, animated: true)
            } else {
                DispatchQueue.main.async {
                    self.saleButton.isHidden = false
                    self.restoreButton.isHidden = false
                }
            }
        }
    }

    func restorePurchases(){
        Purchases.shared.restorePurchases { [weak self] info, error in
            guard let info = info, error == nil else { return }

            if info.entitlements.all["Premium"]?.isActive == true {
                let vc = MainVC()
                self?.navigationController?.pushViewController(vc, animated: true)
            } else {
                DispatchQueue.main.async {
                    let vc = MainVC()
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }

    func setupUI(){

        //Lottie
        animationView = .init(name: "buy")
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
        view.addSubview(restoreButton)
        restoreButton.snp.makeConstraints { make in
            make.top.equalTo(saleButton.snp.bottom).offset(10)
            make.width.equalTo(200)
            make.height.equalTo(75)
            make.centerX.equalTo(view.center)
        }
    }

}
