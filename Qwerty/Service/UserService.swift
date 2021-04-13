//
//  UserService.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import UIKit

class UserService {
    
    let defaults = UserDefaults.standard
    
    func saveUserPassword(_ password : String) {
        defaults.set(password, forKey: "password")
    }
    
    func getUserPassword() -> String {
        if let userPassword = defaults.string(forKey: "password") {
            return userPassword
        } else {
            return ""
        }
    }
    
    func getUserDevice() -> String {
        return UIDevice.current.name
    }
    
    func saveUserStartDate(){
        defaults.set(Date(), forKey: "startDate")
    }
    
    func getUserStartDate() -> Date {
        if let startDate = defaults.object(forKey: "startDate") {
            return startDate as! Date
        } else {
            return Date()
        }
    }
    
//    func getUsername() -> String {
//
//
//    }
//
    
    
}
