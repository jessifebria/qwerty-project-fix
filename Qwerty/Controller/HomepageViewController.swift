//
//  HomepageViewController.swift
//  Qwerty
//
//  Created by Nathanael DJ on 09/04/21.
//

import UIKit

class HomepageViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var riwayatView: UITableView!
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var periodOfDate: UILabel!
    @IBOutlet weak var settingIcon: UIImageView!
    @IBOutlet weak var dailyCount: UILabel!
    
    var riwayatData = HistoryService().getHistory(filter: "Day")
    var kataUnikData = KataKotorService().getTopFour(filter: "All")
    var boxContent = DetailKalimatViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        dailyCount.text = "\(riwayatData.count)"
        collectionView.dataSource = self
        collectionView.delegate = self
        riwayatView.delegate = self
        riwayatView.dataSource = self
        totalCount.text = String(kataUnikData.1)
        periodOfDate.text = "11 Jan 2020 - 22 Mar 2021"
        
        

        // Do any additional setup after loading the view.
    }
}
    extension HomepageViewController : UICollectionViewDataSource {
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return riwayatData.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "riwayatHariIniCell", for: indexPath) as! boxCollectionViewCell
            let riwayat = riwayatData[indexPath.row]
            cell.riwayatHariIni = riwayat
            return cell
            
            
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
       
    }

extension HomepageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        

    }
    
}

extension HomepageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProgressKataUnik", for: indexPath) as! ProgressKataUnikViewCell
        cell.kataKotorLabel.text = kataUnikData.0[indexPath.row].kata.capitalized
        cell.countRiwayat.text = String(kataUnikData.0[indexPath.row].total)
        cell.progressRiwayat.setProgress(Float(kataUnikData.0[indexPath.row].total)/Float(kataUnikData.1), animated: false)
        return cell
    }

}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


