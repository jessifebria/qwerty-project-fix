//
//  NavigationHelper.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 30/09/21.
//

import UIKit

extension UINavigationController {
    
    func changeBackground() {
        self.view.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1)
    }
    
    func setupNavBar() {
        let standardNavBarAppearance = UINavigationBarAppearance()
        let scrolledNavBarAppearance = UINavigationBarAppearance()
       
        standardNavBarAppearance.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        standardNavBarAppearance.backgroundColor = #colorLiteral(red: 0, green: 0.3772116005, blue: 0.6474196315, alpha: 1)
        standardNavBarAppearance.backButtonAppearance.normal.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.white]
        standardNavBarAppearance.backIndicatorImage.withTintColor(.white)
        
        scrolledNavBarAppearance.largeTitleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black]
        scrolledNavBarAppearance.backgroundColor = #colorLiteral(red: 0.9450980392, green: 0.9607843137, blue: 0.968627451, alpha: 1)
        scrolledNavBarAppearance.backButtonAppearance.normal.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.3772116005, blue: 0.6474196315, alpha: 1)]
        scrolledNavBarAppearance.backIndicatorImage.withTintColor(#colorLiteral(red: 0, green: 0.3772116005, blue: 0.6474196315, alpha: 1))
        
        self.navigationBar.standardAppearance = standardNavBarAppearance
        self.navigationBar.scrollEdgeAppearance = scrolledNavBarAppearance

    }
}
