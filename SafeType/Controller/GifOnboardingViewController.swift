//
//  NewOnboardingViewController.swift
//  SafeType
//
//  Created by Jonathan Herbert on 01/06/22.
//

import UIKit

class GifOnboardingViewController: UIViewController{
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    override func viewDidLoad() {
        gifImageView.loadGif(name: "tutorial")
    }
    
    @IBAction func goToSetting(_ sender: Any) {
        UIApplication.shared.open(URL(string:"App-Prefs:root=General")!)
    }
}
