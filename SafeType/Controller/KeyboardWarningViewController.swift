//
//  KeyboardWarningViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 12/04/21.
//

import UIKit

class KeyboardWarningViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    let gifView = UIImageView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        let ten = view.frame.size.height/84.4
        let one = view.frame.size.height/844
        let page = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
        let onboardImage = UIImageView.init(image: UIImage.init(named: "WarningOnboarding"))
        onboardImage.frame = CGRect(x:0,y:0,width:view.frame.size.width*(one*0.8),height:view.frame.size.height*(one*0.8))
        onboardImage.contentMode = .scaleAspectFit
        onboardImage.center = CGPoint(x:view.frame.size.width/2,y: view.frame.size.height/2.3*one)
        gifView.loadGif(name: "tutorial")
        gifView.frame = CGRect(x:0,y:0,width:ten*33,height:ten*22)
        gifView.center = CGPoint(x:view.frame.size.width/2,y: view.frame.size.height/2.25*one)
        page.addSubview(gifView)
        let settingButton = UIButton(frame: CGRect(x: 0, y: 0, width: ten*30, height: ten*4))
        settingButton.center = CGPoint(x:view.frame.size.width/2,y: view.frame.size.height - ten*10)
        settingButton.setTitle("Go to Setting", for: .normal)
        settingButton.layer.cornerRadius = ten
        settingButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
        settingButton.setTitleColor(UIColor.white, for: .normal)
        settingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: ten*1.8)
        settingButton.addTarget(self, action: #selector(self.settingButton), for: .touchUpInside)
        page.addSubview(settingButton)
        page.addSubview(onboardImage)
        mainView.addSubview(page)
        if KeyboardService().isKeyboardExtensionEnabled() {
            performSegue(withIdentifier: "seguePasswordToHomepage", sender: nil)
            // keyboard sudah terpasang -- go to homepage
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if KeyboardService().isKeyboardExtensionEnabled() {
            performSegue(withIdentifier: "seguePasswordToHomepage", sender: nil)
            // keyboard sudah terpasang -- go to homepage
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if KeyboardService().isKeyboardExtensionEnabled() {
            performSegue(withIdentifier: "seguePasswordToHomepage", sender: nil)
            // keyboard sudah terpasang -- go to homepage
        }
    }
    
    @objc func settingButton(sender : UIButton) {
        UIApplication.shared.open(URL(string:"App-prefs:General&path=Keyboard")!)
    }

}
