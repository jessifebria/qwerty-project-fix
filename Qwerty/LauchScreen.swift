//
//  LauchScreen.swift
//  Qwerty
//
//  Created by Nathanael DJ on 13/04/21.



//  jadi rencananya file ini buat bikin konten di LaunchScreen.storyboard ada animasi fade in/fade out sbelum ke onboarding ato ke homepage
//  kalo beneran mau dipake, ubah alpha iconImage & nameLabel ke 0.0
import Foundation
import UIKit

class ViewController: UIViewController{
    @IBOutlet weak var iconImage: UIImageView!  //konekin ke icon
    @IBOutlet weak var nameLabel: UILabel!      //konekin ke tulisan "qwerty"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iconImage.alpha = 0.0
        self.nameLabel.alpha = 0.0
        //this is where the magic starts
        if self.iconImage.alpha == 0.0{
            //animasi fade in
            UIImageView.animate(withDuration: 1.5,
                                delay: 0.2,
                                options: .curveEaseOut,
                                animations:{
                                    self.iconImage.alpha = 1.0
                                })
        } else {
            //animasi fade out
            UIImageView.animate(withDuration: 1.5,
                                delay: 0.2,
                                options: .curveEaseOut,
                                animations:{
                                    self.iconImage.alpha = 0.0
                                })
        
        }
        if self.iconImage.alpha == 1.0{
            //tulisan qwerty muncul kalo icon udah muncul
            UILabel.animate(withDuration: 1.5,
                            delay: 0.2,
                            options: .curveEaseOut,
                            animations: {
                                self.nameLabel.alpha = 1.0
                            })
        }
    }
}
//after that, segue ke onboard/homepage
