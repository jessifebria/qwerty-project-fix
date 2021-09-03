//
//  MasukkanPassViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 12/04/21.
//

import UIKit

class MasukkanPassViewController: UIViewController {
    
    var newPass = String()
    var tempPass = ""
    
    @IBOutlet weak var circle1: UIImageView!
    @IBOutlet weak var circle2: UIImageView!
    @IBOutlet weak var circle3: UIImageView!
    @IBOutlet weak var circle4: UIImageView!
    @IBOutlet weak var circle5: UIImageView!
    @IBOutlet weak var circle6: UIImageView!
    
    @IBOutlet weak var warningPass: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        warningPass.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func passButton(_ sender: UIButton) {
        if tempPass.count < 6 {
            tempPass = tempPass + sender.currentTitle!
            imageLoad()
        }else{
            imageLoad()
        }
    }
    @IBAction func passDelete(_ sender: UIButton) {
        if tempPass.count > 0 {
            tempPass.removeLast()
            imageLoad()
        }else{
            imageLoad()
        }
    }
    
    func imageLoad(){
        if tempPass.count == 0{
            circle1.image = UIImage.init(systemName: "circle")
            circle2.image = UIImage.init(systemName: "circle")
            circle3.image = UIImage.init(systemName: "circle")
            circle4.image = UIImage.init(systemName: "circle")
            circle5.image = UIImage.init(systemName: "circle")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 1{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle")
            circle3.image = UIImage.init(systemName: "circle")
            circle4.image = UIImage.init(systemName: "circle")
            circle5.image = UIImage.init(systemName: "circle")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 2{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle.fill")
            circle3.image = UIImage.init(systemName: "circle")
            circle4.image = UIImage.init(systemName: "circle")
            circle5.image = UIImage.init(systemName: "circle")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 3{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle.fill")
            circle3.image = UIImage.init(systemName: "circle.fill")
            circle4.image = UIImage.init(systemName: "circle")
            circle5.image = UIImage.init(systemName: "circle")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 4{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle.fill")
            circle3.image = UIImage.init(systemName: "circle.fill")
            circle4.image = UIImage.init(systemName: "circle.fill")
            circle5.image = UIImage.init(systemName: "circle")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 5{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle.fill")
            circle3.image = UIImage.init(systemName: "circle.fill")
            circle4.image = UIImage.init(systemName: "circle.fill")
            circle5.image = UIImage.init(systemName: "circle.fill")
            circle6.image = UIImage.init(systemName: "circle")
        }else if tempPass.count == 6{
            circle1.image = UIImage.init(systemName: "circle.fill")
            circle2.image = UIImage.init(systemName: "circle.fill")
            circle3.image = UIImage.init(systemName: "circle.fill")
            circle4.image = UIImage.init(systemName: "circle.fill")
            circle5.image = UIImage.init(systemName: "circle.fill")
            circle6.image = UIImage.init(systemName: "circle.fill")
            if tempPass == UserService().getUserPassword() {
                if KeyboardService().isKeyboardExtensionEnabled() {
                    performSegue(withIdentifier: "seguePasswordToHomepage", sender: nil)
                    // keyboard sudah terpasang -- go to homepage
                } else {
                    // keyboard belum terpasang
                    performSegue(withIdentifier: "WarningKeyboad", sender: nil)
                    print("keyboard belum terpasang")
                }
                
            }else{
                view.shake()
                tempPass = ""
                imageLoad()
                warningPass.isHidden = false
            }
        }
    }
    
}
