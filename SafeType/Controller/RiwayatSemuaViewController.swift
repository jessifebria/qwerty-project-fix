//
//  ViewController.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 06/04/21.
//

import UIKit

class RiwayatSemuaViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var navBar: UINavigationItem!
    
    var filterContentShown: String! = "All"
    var currentTableView: Int! = 0
    let blueColor: UIColor! = #colorLiteral(red: 0, green: 0.3776819408, blue: 0.6683544517, alpha: 1)

    
    private var riwayatData = HistoryService().getHistory(filter: "All")
    private var kataUnikData = KataKotorService().getUniqueKataKotor(filter: "All")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        title = "Riwayat"
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.layoutIfNeeded()
        
        tabBarController?.title = "Riwayat"
        tabBarController?.tabBarItem.selectedImage = UIImage(named: "clock.fill")
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableData), name: UIApplication.willEnterForegroundNotification, object: nil)
        var jumlah = kataUnikData.countTotal
        tableView.delegate = self
        tableView.dataSource = self
        print(Converter.convertDateToStringYearDateHourMinute(date: UserService().getUserStartDate()))
        
        let colorNotSelected = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let colorSelected = [NSAttributedString.Key.foregroundColor: blueColor]
        segmentedControl.layer.borderWidth = 0.4
        segmentedControl.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        segmentedControl.setTitleTextAttributes(colorNotSelected, for: .normal)
        segmentedControl.setTitleTextAttributes(colorSelected, for: .selected)
        
        if currentTableView == 0 {
            segmentedControl.selectedSegmentIndex = 0
        }
        else {
            segmentedControl.selectedSegmentIndex = 1
        }

        let containerView = UIControl(frame: CGRect.init(x: 0, y: 0, width: 20, height: 25))
        containerView.addTarget(self, action: #selector(filterAction), for: .touchUpInside)
        let imageSearch = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 20, height: 25))
        imageSearch.image = UIImage(named: "filter")
        containerView.addSubview(imageSearch)
        let searchBarButtonItem = UIBarButtonItem(customView: containerView)
        searchBarButtonItem.width = 20
        self.navigationItem.rightBarButtonItem = searchBarButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        riwayatData = HistoryService().getHistory(filter: filterContentShown)
        kataUnikData = KataKotorService().getUniqueKataKotor(filter: filterContentShown)
        setBlueBackground(view: self)
        tableView.reloadData()
    }
    
    @IBAction func switchViewAction (_ sender: UISegmentedControl) {
        currentTableView = sender.selectedSegmentIndex
        tableView.reloadData()
    }
    
    @IBAction func filterAction (_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "filterSemuaRiwayatSegue", sender: nil)
    }
    
    @IBAction func unwindToRiwayat(_ sender: UIStoryboardSegue) {
        riwayatData = HistoryService().getHistory(filter: filterContentShown)
        kataUnikData = KataKotorService().getUniqueKataKotor(filter: filterContentShown)
        tableView.reloadData()
    }
    
    @objc func reloadTableData(_ notification: Notification) {
        riwayatData = HistoryService().getHistory(filter: filterContentShown)
        kataUnikData = KataKotorService().getUniqueKataKotor(filter: filterContentShown)
        tableView.reloadData()
    }
}

extension RiwayatSemuaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        var selectedCell: UITableViewCell = tableView.cellForRow(at: indexPath) as! RiwayatSemuaTableViewCell
//        selectedCell.contentView.backgroundColor = .clear
        if let cell = tableView.cellForRow(at: indexPath) as? RiwayatSemuaTableViewCell {

            cell.view.backgroundColor = .lightGray
        }
        switch currentTableView {
        case 0:
            let data = riwayatData[indexPath.row]
            performSegue(withIdentifier: "showDetailSegue", sender: data)
        case 1:
            let kata = kataUnikData.0[indexPath.row].kata
            
            performSegue(withIdentifier: "showRiwayatKataUnik", sender: kata)
        default:
            break
        }

        tableView.deselectRow(at: indexPath, animated: true)        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "filterSemuaRiwayatSegue" {
            if let viewController = segue.destination as? FilterViewController {
                viewController.currentFilter = filterContentShown
            }
        }
        switch currentTableView {
        case 0:
            if let vc = segue.destination as? DetailKalimatViewController, let detailToSend = sender as? History {
                vc.riwayat = detailToSend
            }
        case 1:
            if let vc = segue.destination as? RiwayatKataKotorViewController, let kata = sender {
                let data = vc.riwayatKataUnikData = HistoryService().getHistoryByKataKotor(kataKotor: kata as! String, filter: filterContentShown)
                vc.filter = filterContentShown
                vc.navigationItem.title = kata as! String
                vc.kataKotor = kata as! String
            }
        default:
            break
        }
    }
    
}

extension RiwayatSemuaViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        switch currentTableView {
            case 0:
//                let dictionary = Dictionary(grouping: riwayatData, by: { (element: History) in
//                    return Converter.convertDateToLocaleDate(date: element.waktu!)
//                })
//                return dictionary.count
                return riwayatData.count
            case 1:
                return kataUnikData.0.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch currentTableView {
        case 0:
//            let dictionary = Dictionary(grouping: riwayatData, by: { (element: History) in
//                return Converter.convertDateToLocaleDate(date: element.waktu!)
//            })
//            for i in 0...numberOfSectionsInTableView(tableView: tableView) {
//                if section == i {
//                    var index = i
//
//                }
//            }
//            return dictionary[Array(dictionary)[index].key]!.count
            return riwayatData.count
        case 1:
            return kataUnikData.0.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RiwayatSemuaTableViewCell
        switch currentTableView {
        case 1:
            cell.kalimatLabel.isHidden = true
            cell.kataKotorLabel.text = kataUnikData.0[indexPath.row].kata.capitalized
            cell.timestampLabel.text = "               " + String(kataUnikData.0[indexPath.row].total)
            cell.timestampLabel.font = cell.timestampLabel.font.withSize(16)
            cell.view.backgroundColor = .white
        default:
            cell.riwayat = riwayatData[indexPath.row]
            cell.timestampLabel.font = cell.timestampLabel.font.withSize(12)
            cell.kalimatLabel.isHidden = false
            cell.view.backgroundColor = .white
        }
        return cell
    }

}
