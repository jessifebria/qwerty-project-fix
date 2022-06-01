//
//  CreatePassOnboardingViewController.swift
//  SafeType
//
//  Created by Jonathan Herbert on 01/06/22.
//

import UIKit

class CreatePassOnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func createPassword(_ sender: Any) {
        performSegue(withIdentifier: "goToSetPassword", sender: sender)
    }
}
