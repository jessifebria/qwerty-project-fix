//
//  ViewController.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 06/04/21.
//

import UIKit

class RiwayatSemuaViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var navBar: UINavigationBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    
    
    private let riwayatData = HistoryService().getHistory(filter: "All")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Riwayat"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        print(riwayatData)
        let katakotor = KataKotorService().getAllKataKotor()
        for i in katakotor {
            print(i.kata)
            print(i.total)
        }
        
        // Do any additional setup after loading the view.
    }

}

extension RiwayatSemuaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension RiwayatSemuaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riwayatData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RiwayatSemuaTableViewCell
        cell.riwayat = riwayatData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
