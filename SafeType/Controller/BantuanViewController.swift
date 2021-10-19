//
//  BantuanViewController.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 15/10/21.
//

import UIKit

class BantuanViewController: UIViewController {
    let tableView = UITableView()
    let bantuanContents = loadBantuanStaticData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        self.title = "Bantuan"
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(BantuanTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
    
}

extension BantuanViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BantuanTableViewCell
        cell.bantuan = bantuanContents[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bantuanContents.count
    }

}
