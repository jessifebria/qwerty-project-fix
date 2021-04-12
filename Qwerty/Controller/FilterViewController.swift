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
//        indexChosen = indexPath
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let vc = segue.destination as! RiwayatSemuaViewController
            vc.filterContentShown = filtersParameter[indexPath.row]
        }
       
    }
    
}

extension FilterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "filterCell", for: indexPath) as! FilterTableViewCell
        cell.title = filters[indexPath.row]
        if indexPath.row == 4 {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
}
