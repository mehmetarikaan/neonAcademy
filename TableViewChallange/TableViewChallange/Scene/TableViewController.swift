//
//  TableViewController.swift
//  TableViewChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import UIKit

private let cellreuseIdentifier = "TableViewCell"

final class TableViewController: UITableViewController {
    
    lazy var segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["iOS Team", "Anroid Team", "Desing Team"])
        sc.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    var selectArrayName = [String]()
    var selectArrayAges = [Int]()
    var selectArrayHometown = [String]()
    var selectArrayEmail = [String]()
    
    var iOSDevelopersName = [String]()
    var iOSDevelopersage = [Int]()
    var iOSDevelopersHometown = [String]()
    var iOSDevelopersEmail = [String]()
    
    var designTeamNames = [String]()
    var designTeamage = [Int]()
    var designTeamHometown = [String]()
    var designTeamEmail = [String]()
    
    var androidTeamNames = [String]()
    var androidTeamage = [Int]()
    var androidTeamHometown = [String]()
    var androidTeamEmail = [String]()

    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = segmentedControl
        configureUI()
        filteriOSMember()
        filterAndroidMember()
        filterDesignMember()
        selectArrayName = iOSDevelopersName
        selectArrayAges = iOSDevelopersage
        selectArrayHometown = iOSDevelopersHometown
        selectArrayEmail = iOSDevelopersEmail
    }
    func configureUI(){
        view.addSubview(segmentedControl)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellreuseIdentifier)
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.rowHeight = 130
        tableView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        tableView.tableHeaderView = UIView()
        tableView.tableHeaderView!.frame = .init(x: 0, y: 0, width: view.frame.width, height: 60)
    }
    
    func filteriOSMember(){
        let filteriOS = teamMember.filter {$0.title.contains("iOS Developer")}
        for member in filteriOS {
            iOSDevelopersName.append(member.fullName)
            iOSDevelopersage.append(member.age)
            iOSDevelopersHometown.append(member.homeTown)
            iOSDevelopersEmail.append(member.contactInformation.email)
        }
    }
    
    func filterAndroidMember(){
        let filterAndroid = teamMember.filter{$0.title.contains("Android Developer")}
        for member in filterAndroid{
            androidTeamNames.append(member.fullName)
            androidTeamage.append(member.age)
            androidTeamHometown.append(member.homeTown)
            androidTeamEmail.append(member.contactInformation.email)
        }
    }

    func filterDesignMember(){
        let filterDesign = teamMember.filter{$0.title.contains("UI-UX Designer")}
        for member in filterDesign{
            designTeamNames.append(member.fullName)
            designTeamage.append(member.age)
            designTeamHometown.append(member.homeTown)
            designTeamEmail.append(member.contactInformation.email)
        }
    }

    
    @objc fileprivate func segmentedChange(_ sender: UISegmentedControl){
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                selectArrayName = iOSDevelopersName
                selectArrayAges = iOSDevelopersage
                selectArrayHometown = iOSDevelopersHometown
                selectArrayEmail = iOSDevelopersEmail
            case 1:
                selectArrayName = androidTeamNames
                selectArrayAges = androidTeamage
                selectArrayHometown = androidTeamHometown
                selectArrayEmail = androidTeamEmail
            case 2:
                selectArrayName = designTeamNames
                selectArrayAges = designTeamage
                selectArrayHometown = designTeamHometown
                selectArrayEmail = designTeamEmail
            default:
                selectArrayName = iOSDevelopersName
                selectArrayAges = iOSDevelopersage
                selectArrayHometown = iOSDevelopersHometown
                selectArrayEmail = iOSDevelopersEmail
            }
            tableView.reloadData()
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectArrayName.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellreuseIdentifier, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        cell.fullnameLabel.text = selectArrayName[indexPath.row] + " - "
        cell.agesLabel.text = String(selectArrayAges[indexPath.row])
        cell.homeTownLabel.text = "Hometown: " + selectArrayHometown[indexPath.row]
        cell.emailLabel.text = "Email: " + selectArrayEmail[indexPath.row]
        return cell
    }
}

//TODO: - Header Enabled
extension TableViewController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
