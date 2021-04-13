//
//  HomepageViewController.swift
//  Qwerty
//
//  Created by Nathanael DJ on 09/04/21.
//

import UIKit

class HomepageViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var periodOfDate: UILabel!
    @IBOutlet weak var dailyCount: UILabel!
    @IBOutlet weak var dateRecorded: UILabel!
    @IBOutlet weak var firstWord: UILabel!
    @IBOutlet weak var secondWord: UILabel!
    @IBOutlet weak var thirdWord: UILabel!
    @IBOutlet weak var fourthWord: UILabel!
    @IBOutlet weak var firstProgressBar: UIProgressView!
    @IBOutlet weak var secondProgressBar: UIProgressView!
    @IBOutlet weak var thirdProgressBar: UIProgressView!
    @IBOutlet weak var fourthProgressBar: UIProgressView!
    @IBOutlet weak var firstCount: UILabel!
    @IBOutlet weak var secondCount: UILabel!
    @IBOutlet weak var thirdCount: UILabel!
    @IBOutlet weak var fourthCount: UILabel!
    @IBOutlet weak var totalCount: UILabel!
    @IBOutlet weak var viewKataUnik: UIStackView!
    @IBOutlet weak var lastSeenKeyboard: UILabel!
    
    var labelWord = [UILabel?]()
    var progressBar = [UIProgressView?]()
    var labelCount = [UILabel?]()
        
    var riwayatData = HistoryService().getHistory(filter: "Day")
    var kataUnikData = KataKotorService().getTopFour()
    var tanggal = UserService().getUserStartDate()
    var lastSeen = KeyboardService().getLastSeen()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Ringkasan"
        
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        tabBarController?.tabBar.items?[1].title = "Riwayat"
        
        labelWord = [firstWord, secondWord, thirdWord, fourthWord]
        progressBar = [firstProgressBar, secondProgressBar, thirdProgressBar, fourthProgressBar]
        labelCount = [firstCount, secondCount, thirdCount, fourthCount]
        setProgressKataUnik()
        
        dailyCount.text = "\(riwayatData.count)"
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if lastSeen == Converter.convertStringToDate() {
            lastSeenKeyboard.text = "Keyboard Qwerty belum dipakai"
        }
        else {
            lastSeenKeyboard.text = "Keyboard terakhir digunakan " + Converter.convertDateToStringDateHourMinute(date: lastSeen)
        }
    
        totalCount.text = String(kataUnikData.1)
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapViewKataUnik(_:)))
        gestureRecognizer.numberOfTapsRequired = 1
        gestureRecognizer.numberOfTouchesRequired = 1
        viewKataUnik.addGestureRecognizer(gestureRecognizer)
        viewKataUnik.isUserInteractionEnabled = true
        dateRecorded.text = Converter.convertDateToString(date: tanggal) + " - " + Converter.convertDateToString(date: Date())
     
    }
    
    @objc func tapViewKataUnik(_ gesture: UITapGestureRecognizer) {
        performSegue(withIdentifier: "segueHomepageToKataUnik", sender: nil)
    }
    
    func setProgressKataUnik () {
        let top = kataUnikData.0.count
        if top != 0 {
            for i in 0...top-1 {
                labelWord[i]?.text = kataUnikData.0[i].kata.capitalized
                progressBar[i]?.setProgress(Float(kataUnikData.0[i].total)/Float(kataUnikData.1), animated: false)
                labelCount[i]?.text = String(kataUnikData.0[i].total)
            }
        for j in top...3 {
            labelWord[j]?.text = "---"
            progressBar[j]?.setProgress(0, animated: false)
            labelCount[j]?.text = String(0)
        }
            
        }
        
        else {
            for k in 0...3 {
                labelWord[k]?.text = "---"
                progressBar[k]?.setProgress(0, animated: false)
                labelCount[k]?.text = String(0)
            }
        }
            
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func reloadData() {
        riwayatData = HistoryService().getHistory(filter: "Day")
        kataUnikData = KataKotorService().getTopFour()
        tanggal = UserService().getUserStartDate()
        lastSeen = KeyboardService().getLastSeen()
        collectionView.reloadData()
        dailyCount.text = "\(riwayatData.count)"
        setProgressKataUnik()
        totalCount.text = String(kataUnikData.1)
    }
    
}


extension HomepageViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
            performSegue(withIdentifier: "segueHomepageToDetail", sender: self)
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueHomepageToDetail" {
            if let destination = segue.destination as?
                    DetailKalimatViewController, let index =
                    collectionView.indexPathsForSelectedItems?.first {
                destination.riwayat = riwayatData[index.row]
                }

        }
        if segue.identifier == "segueHomepageToKataUnik" {
            if let destination = segue.destination as?
                    RiwayatSemuaViewController {
                destination.currentTableView = 1
                }
        }
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
            cell.layer.masksToBounds = true
            cell.contentView.layer.cornerRadius = 14
            return cell
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                    let itemsPerRow:CGFloat = 2
                    let padding:CGFloat = 20
                    let itemWidth = 190
                    let itemHeight = 150
                    return CGSize(width: itemWidth, height: itemHeight)
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


