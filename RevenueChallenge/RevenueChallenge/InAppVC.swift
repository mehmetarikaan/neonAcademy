
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
//
//import UIKit
//import RevenueCat
//import SnapKit
//class InAppVC: UIViewController {
//  private let imageView: UIImageView = {
//    let iv = UIImageView()
//    iv.image = UIImage(named: "neon-logo")
//    iv.contentMode = .scaleAspectFit
//    return iv
//  }()
//  private let subscribeButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.backgroundColor = .systemPurple
//    button.layer.cornerRadius = 16
//    button.setTitle("Buy", for: .normal)
//    button.setTitleColor(.white, for: .normal)
//    return button
//  }()
//  private let restoreButton: UIButton = {
//    let button = UIButton(type: .system)
//    button.backgroundColor = .black
//    button.setTitle("Restore", for: .normal)
//    button.setTitleColor(.link, for: .normal)
//    button.isHidden = true
//    return button
//  }()
//  private let label: UILabel = {
//    let label = UILabel()
//    label.text = "You Are Subbbb"
//    label.textColor = .systemPurple
//    label.textAlignment = .center
//    label.font = UIFont(name: "Marker Felt", size: 32)
//    label.isHidden = true
//    return label
//  }()
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    view.addSubview(imageView)
//    view.addSubview(subscribeButton)
//    view.addSubview(restoreButton)
//    view.addSubview(label)
//    imageView.snp.makeConstraints { make in
//      make.top.equalTo(view.safeAreaLayoutGuide).offset(60)
//      make.left.equalToSuperview().offset(60)
//      make.right.equalToSuperview().inset(60)
//      make.height.equalTo(120)
//    }
//    subscribeButton.snp.makeConstraints { make in
//      make.top.equalTo(imageView.snp_bottomMargin).offset(80)
//      make.left.equalToSuperview().offset(60)
//      make.right.equalToSuperview().inset(60)
//      make.height.equalTo(60)
//    }
//    restoreButton.snp.makeConstraints { make in
//      make.top.equalTo(subscribeButton.snp_bottomMargin).offset(40)
//      make.left.equalToSuperview().offset(60)
//      make.right.equalToSuperview().inset(60)
//      make.height.equalTo(60)
//    }
//    label.snp.makeConstraints { make in
//      make.centerX.equalTo(view.center)
//      make.top.equalTo(imageView.snp_bottomMargin).offset(40)
//    }
//    subscribeButton.addTarget(self, action: #selector(didTapSubscribe), for: .touchUpInside)
//    restoreButton.addTarget(self, action: #selector(didTapRestore), for: .touchUpInside)
//    setupUI()
//  }
//  @objc func didTapSubscribe() {
//    fetchPackage { [weak self] package in
//      self?.purchase(package: package)
//    }
//  }
//  @objc func didTapRestore() {
//    restorePurchases()
//  }
//  func setupUI() {
//    Purchases.shared.getCustomerInfo { [weak self] info, error in
//      guard let info = info, error == nil else { return }
//      if info.entitlements.all["Premium"]?.isActive == true {
//        DispatchQueue.main.async {
//          self?.label.isHidden = false
//          self?.subscribeButton.isHidden = true
//          self?.restoreButton.isHidden = false
//          let controller = MainVC()
//         self?.navigationController?.pushViewController(controller, animated: true)
//        }
//      } else {
//        DispatchQueue.main.async {
//          self?.label.isHidden = true
//          self?.subscribeButton.isHidden = false
//          self?.restoreButton.isHidden = true
//        }
//      }
//    }
//  }
//  func fetchPackage(completion: @escaping (RevenueCat.Package) -> Void) {
//    Purchases.shared.getOfferings { offerings, error in
//      guard let offerings = offerings, error == nil else {
//        return
//      }
//      guard let package = offerings.all.first?.value.availablePackages.first else {
//        return
//      }
//      completion(package)
//    }
//  }
//  func purchase(package: RevenueCat.Package) {
//    Purchases.shared.purchase(package: package) { [weak self] transaction, info, error, userCancelled in
//      guard let transaction = transaction,
//         let info = info,
//         error == nil, !userCancelled else {
//        return
//      }
//      if info.entitlements.all["Premium"]?.isActive == true {
//        DispatchQueue.main.async {
//          self?.label.isHidden = false
//          self?.subscribeButton.isHidden = true
//          self?.restoreButton.isHidden = false
//          let controller = MainVC()
//          self?.navigationController?.pushViewController(controller, animated: true)
//        }
//      } else {
//        DispatchQueue.main.async {
//          self?.label.isHidden = true
//          self?.subscribeButton.isHidden = false
//          self?.restoreButton.isHidden = true
//        }
//      }
//    }
//  }
//  func restorePurchases() {
//    Purchases.shared.restorePurchases { [weak self] info, error in
//      guard let info = info, error == nil else { return }
//      if info.entitlements.all["Premium"]?.isActive == true {
//        DispatchQueue.main.async {
//          self?.label.isHidden = true
//          self?.subscribeButton.isHidden = false
//          self?.restoreButton.isHidden = true
//          let controller = MainVC()
//          self?.navigationController?.pushViewController(controller, animated: true)
//        }
//      } else {
//        DispatchQueue.main.async {
//          self?.label.isHidden = false
//          self?.subscribeButton.isHidden = true
//          self?.restoreButton.isHidden = false
//        }
//      }
//    }
//  }
//}
