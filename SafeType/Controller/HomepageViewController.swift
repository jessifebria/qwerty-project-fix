//
//  HomepageViewController.swift
//  Qwerty
//
//  Created by Nathanael DJ on 09/04/21.
//

import UIKit

class HomepageViewController: UIViewController {
    @IBOutlet weak var mainView: UIView!
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
    @IBOutlet weak var allData: UILabel!
    @IBOutlet weak var today: UILabel!
    @IBOutlet weak var noDataLabel: UILabel!
    @IBOutlet weak var noDataView: UIView!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
    
    var labelWord = [UILabel?]()
    var progressBar = [UIProgressView?]()
    var labelCount = [UILabel?]()
    
    
    var totalKataKotor = KataKotorService().getUniqueKataKotor(filter: "Day").countTotal
    var riwayatData = HistoryService().getHistory(filter: "Day")
    var kataUnikData = KataKotorService().getTopFour()
    var tanggal = UserService().getUserStartDate()
    var lastSeen = KeyboardService().getLastSeen()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.3772116005, blue: 0.6474196315, alpha: 1)
        setLastSeenConstraint()
        self.navigationItem.title = "Ringkasan"
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData), name: UIApplication.willEnterForegroundNotification, object: nil)
        
        tabBarController?.tabBar.items?[1].title = "Riwayat"
        
        labelWord = [firstWord, secondWord, thirdWord, fourthWord]
        progressBar = [firstProgressBar, secondProgressBar, thirdProgressBar, fourthProgressBar]
        labelCount = [firstCount, secondCount, thirdCount, fourthCount]
        setProgressKataUnik()
        setLastSeen()
        
        dailyCount.text = "\(totalKataKotor)"
        allData.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        today.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        firstWord.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        secondWord.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        thirdWord.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        fourthWord.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        topView.clipsToBounds = true
        topView.layer.cornerRadius = 30
        topView.layer.maskedCorners = [.layerMinXMaxYCorner] // Bottom left corner
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
    
    func setLastSeen(){
        if lastSeen == Converter.convertStringToDate(dateInString: "1999-12-01 00:00:00") {
            lastSeenKeyboard.text = "Keyboard SafeType belum dipakai"
        }
        else {
            lastSeenKeyboard.text = "Keyboard terakhir digunakan " + Converter.convertDateToStringYearDateHourMinute(date: lastSeen)
        }
    }
    
    func setLastSeenConstraint() {
        if riwayatData.count == 0 {
            DispatchQueue.main.async {
                self.noDataLabel.isHidden = false
                self.noDataView.isHidden = false
    
                for constraint in self.view.constraints {
                    if constraint.identifier == "lastSeenKeyboardToCollectionView" {
                        constraint.priority = .defaultLow
                    }
                    else if constraint.identifier == "lastSeenKeyboardToNoDataView" {
                        constraint.priority = .defaultHigh
                    }
                    
                    
                }
            }
        }
        else {
            DispatchQueue.main.async {
                self.noDataLabel.isHidden = true
                self.noDataView.isHidden = true
           
                for constraint in self.view.constraints {
                    if constraint.identifier == "lastSeenKeyboardToNoDataView" {
                        constraint.priority = .defaultLow
                    }
                    else if constraint.identifier == "lastSeenKeyboardToCollectionView" {
                        constraint.priority = .defaultHigh
                    }
                }
            }
        }
    }
    
    func setProgressKataUnik () {
        let top = kataUnikData.0.count
        if top != 0 {
            for i in 0...top-1 {
                labelWord[i]?.text = kataUnikData.0[i].kata.capitalized
                progressBar[i]?.setProgress(Float(kataUnikData.0[i].total)/Float(kataUnikData.1), animated: false)
                labelCount[i]?.text = String(kataUnikData.0[i].total)
            }
            if top < 4 {
                for j in top...3 {
                    labelWord[j]?.text = "---"
                    progressBar[j]?.setProgress(0, animated: false)
                    labelCount[j]?.text = "---"
                }
            }
            
        }
        
        else {
            for k in 0...3 {
                labelWord[k]?.text = "---"
                progressBar[k]?.setProgress(0, animated: false)
                labelCount[k]?.text = "---"
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
        dailyCount.text = "\(KataKotorService().getUniqueKataKotor(filter: "Day").countTotal)"
        setProgressKataUnik()
        totalCount.text = String(kataUnikData.1)
        setLastSeen()
        setLastSeenConstraint()
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
            
            return cell
            
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                    let itemWidth = 190
                    let itemHeight = 150
                    return CGSize(width: itemWidth, height: itemHeight)
        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }
        
       
    }

