//
//  NavigationHelper.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 30/09/21.
//

import UIKit

extension UINavigationController {
    func changeBarTintColor() {
        let navBarBackground = self.navigationController?.navigationBar.scrollEdgeAppearance?.backgroundColor
        if navBarBackground == #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1) {
            self.navigationBar.barTintColor = #colorLiteral(red: 0.1450980392, green: 0.3725490196, blue: 0.6274509804, alpha: 1)
        }
        else if navBarBackground == #colorLiteral(red: 0.1450980392, green: 0.3725490196, blue: 0.6274509804, alpha: 1) {
            self.navigationBar.barTintColor =  #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1)
        }
    }
    
    func changeBackground() {
        self.view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1)
    }
}
