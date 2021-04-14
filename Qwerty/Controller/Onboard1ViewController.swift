//
//  Onboard1ViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 14/04/21.
//

import UIKit

class Onboard1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet private var imageView: UIImageView! {
          didSet {
              imageView.isUserInteractionEnabled = true
          }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
