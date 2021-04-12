//
//  HomepageViewController.swift
//  Qwerty
//
//  Created by Nathanael DJ on 09/04/21.
//

import UIKit

class HomepageViewController: UIViewController, UICollectionViewDelegate {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var botView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var riwayatView: UITableView!

    @IBOutlet weak var settingIcon: UIImageView!
    @IBOutlet weak var berandaIcon: UIImageView!
    @IBOutlet weak var riwayatIcon: UIImageView!
    
    @IBOutlet weak var dailyCount: UILabel!
    
    var riwayatData = HistoryService().getHistory(filter: "Day")
    var boxContent = DetailKalimatViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        dailyCount.text = "\(riwayatData.count)"
        collectionView.dataSource = self
        collectionView.delegate = self
        
        
        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


