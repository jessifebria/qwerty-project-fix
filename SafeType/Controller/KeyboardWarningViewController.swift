//
//  KeyboardWarningViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 12/04/21.
//

import UIKit

class KeyboardWarningViewController: UIViewController {
    
    @IBOutlet weak var gifTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var gifHeight: NSLayoutConstraint!
    @IBOutlet weak var settingButtonConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gifImageView.loadGif(name: "tutorial")
        gifTopConstraint.constant = view.frame.height/4.2
        gifHeight.constant = view.frame.height/3.5
        settingButtonConstraint.constant = view.frame.height/6
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSetting(_ sender: Any) {
        UIApplication.shared.open(URL(string:"App-Prefs:root=General")!)
    }
    
}
