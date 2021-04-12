//
//  FilterViewController.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 11/04/21.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var selesaiButton: UIButton!
    var filterToPass: String!
 
    let filters = ["Hari ini", "Minggu ini", "Bulan ini", "Tahun ini", "Semua"]
    let filtersParameter = ["Day", "Week", "Month", "Year", "All"]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func selesaiButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
        
}

extension FilterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filter = filtersParameter[indexPath.row]
        filterToPass = filter
        
        dismiss(animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! RiwayatSemuaViewController
        vc.filterContentShown = filterToPass
        print("ini udah dari vc")
        print(vc.filterContentShown)
    }
    
}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterTableViewCell
        cell.title = filters[indexPath.row]
        cell.checkmarkImage.isHidden = true
        return cell
    }

}
