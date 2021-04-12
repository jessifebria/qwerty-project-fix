//
//  KeyboardWarningViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 12/04/21.
//

import UIKit

class KeyboardWarningViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let settingButton = UIButton(frame: CGRect(x: 20, y: 20, width: 300, height: 40))
        settingButton.setTitle("Go to Setting", for: .normal)
        settingButton.center = CGPoint(x:mainView.frame.size.width/2,y: 680)
        settingButton.layer.cornerRadius = 8.0
        settingButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
        settingButton.setTitleColor(UIColor.white, for: .normal)
        settingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        settingButton.addTarget(self, action: #selector(self.settingButton), for: .touchUpInside)
        mainView.addSubview(settingButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func settingButton(sender : UIButton) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }

}
