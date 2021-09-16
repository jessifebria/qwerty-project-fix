//
//  SettingViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var settingsTableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Pengaturan"
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self

    }
    
    @IBAction func selesaiButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped settings cell")
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
    
}
