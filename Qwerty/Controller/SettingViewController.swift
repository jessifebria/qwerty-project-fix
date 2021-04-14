//
//  SettingViewController.swift
//  Qwerty
//
//  Created by Jonathan Herbert on 09/04/21.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var initial: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var device: UILabel!
    @IBOutlet weak var circle: UIImageView!
    
    var names = UIDevice.current.name
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubviewToBack(circle)
        initial.text = String(names.first!)
        name.text = names
        device.text = UserService().getUserDevice()
        //kalo kebalik tinggal diganti yo
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selesaiButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
