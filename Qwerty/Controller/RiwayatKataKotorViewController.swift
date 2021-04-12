//
//  KataUnikViewController.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 11/04/21.
//

import UIKit

class RiwayatKataKotorViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var filter: String!
   
    var riwayatKataUnikData = [History?]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension RiwayatKataKotorViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = riwayatKataUnikData[indexPath.row]
        performSegue(withIdentifier: "showDetailSegueFromKataKotor", sender: data)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailKalimatViewController, let detailToSend = sender as? History {
                vc.riwayat = detailToSend
        }
    }
}

extension RiwayatKataKotorViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return riwayatKataUnikData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "riwayatKataKotorCell", for: indexPath) as! RiwayatKataKotorTableViewCell
        cell.riwayat = riwayatKataUnikData[indexPath.row]
        return cell
    }

}

