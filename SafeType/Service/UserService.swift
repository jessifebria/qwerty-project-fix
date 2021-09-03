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
        return UIDevice.current.model
    }
    
    func saveUserStartDate(){
        defaults.set(Date(), forKey: "startDate")
    }
    
    func getUserStartDate() -> Date {
        if defaults.object(forKey: "startDate") != nil{
            print("ASDKJFHASDJFHKASJDFASJDFKASJDFJASHDFJASD")
            return defaults.object(forKey: "startDate") as! Date
        } else {
            return Converter.convertStringToDate(dateInString: "2021-03-08 12:23:45")
        }
    }
    
//    func getUsername() -> String {
//
//
//    }
//
    
    
}
