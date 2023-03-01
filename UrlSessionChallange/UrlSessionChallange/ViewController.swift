//
//  ViewController.swift
//  UrlSessionChallange
//
//  Created by Mehmet Arıkan on 1.03.2023.
//

import UIKit

class ViewController: UITableViewController {
    var data = [BadBoy]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fetchApi(URL: "https://api.breakingbadquotes.xyz/v1/quotes/20") { result in
            self.data = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchApi(URL url: String, completion: @escaping ([BadBoy]) -> Void){
        let url = URL(string: url) //URL
        let session = URLSession.shared //URLSESSION
        let dataTask = session.dataTask(with: url!) { data, response, error in // istek gönderdim
            if data != nil && error == nil { // data'nın kontrolünü yaptım
                do {
                    let parsData = try JSONDecoder().decode([BadBoy].self, from: data!) // data doluysa modelime json olara decode ettim.
                    completion(parsData)
                } catch {
                    print("Hatasız kul olmaz")
                }
                
            }
        }
        dataTask.resume()
    }
}

extension ViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].quote
        return cell
    }
    
}

