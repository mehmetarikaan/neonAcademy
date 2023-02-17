//
//  ViewController.swift
//  SearchBarChallange
//
//  Created by Mehmet Arıkan on 17.02.2023.
//

import UIKit

private let reuseIdentifier = "TableViewCell"

final class ViewController: UITableViewController {
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var isSearch: Bool {
        return searchController.isActive && !searchController.searchBar.text!.isEmpty
    }
    
    private var filterName = [String]()
    var memberName = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureSearchController()
        for member in teamMember {
            memberName.append(member.fullName)
        }
    }
    func configureTableView() {
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 50
    }
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.placeholder = "Search Member in Neon Apps"
        navigationItem.searchController = searchController
        definesPresentationContext = false
    }
}

extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearch ? filterName.count : memberName.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TableViewCell
        
        let name = isSearch ? filterName[indexPath.row] : memberName[indexPath.row]
        cell.fullNameLabel.text = name
        
        return cell
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchText = searchController.searchBar.text?.lowercased() else { return }
        filterName = memberName.filter({
            $0.lowercased().contains(searchText) ||
                $0.uppercased().contains(searchText)
        })
        
        self.tableView.reloadData()
    }
}
