//
//  HistoryController.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import CoreData
import UIKit

class HistoryService {
    
    let contextService = ContextService()
    
    func getHistory(filter : String) -> [History] {
        let request : NSFetchRequest<History> = History.fetchRequest()
        var startDate : Date
        
        if filter == "Day" {
            startDate = Date().startOfDay
            print(Converter.convertDateToStringHourMinute(date: startDate as Date))
        } else if filter == "Week" {
            startDate = Date().startOfWeek!
        } else if filter == "Month" {
            startDate = Date().startOfMonth
        } else if filter == "Year" {
            startDate = Date().startOfYear
        } else {
            return contextService.loadHistory(request)
        }
        
        let datePredicate = NSPredicate(format: "waktu >= %@", startDate as NSDate)
        print("requesting")
        request.predicate = datePredicate
        
        return contextService.loadHistory(request)
    }
    
    func getHistoryByKataKotor( kataKotor : String, filter : String) -> [History] {
        let request : NSFetchRequest<History> = History.fetchRequest()
        let kataKotor = ", \(kataKotor),"
        var startDate : Date
        
        if filter == "Day" {
            startDate = Date().startOfDay
            print(Converter.convertDateToStringHourMinute(date: startDate as Date))
        } else if filter == "Week" {
            startDate = Date().startOfWeek!
        } else if filter == "Month" {
            startDate = Date().startOfMonth
        } else if filter == "Year" {
            startDate = Date().startOfYear
        } else {
            request.predicate = NSPredicate(format: "kataKotor CONTAINS[cd] %@", kataKotor)
            return contextService.loadHistory(request)
        }
        
        let compoundPredicate = NSPredicate(format: "waktu >= %@ AND kataKotor CONTAINS[cd] %@", startDate as NSDate, kataKotor)
        print(kataKotor)
        print("requesting")
        request.predicate = compoundPredicate
        
        return contextService.loadHistory(request)
    }
    
    func updateHistoryByKataKotor(_ kataKotor : String){
        let request : NSFetchRequest<History> = History.fetchRequest()
        let kataKotor = ", \(kataKotor.capitalized),"

        request.predicate = NSPredicate(format: "kataKotor CONTAINS[cd] %@", kataKotor)
        
        let historyContains = contextService.loadHistory(request)
        
        for history in historyContains {
            print(history.kataKotor!)
            if history.kataKotor?.components(separatedBy: " ").count == 2 {
                contextService.deleteHistory(history)
            } else {
                var newKataKotor = history.kataKotor!
                while newKataKotor.contains(", Tai,"){
                    newKataKotor = newKataKotor.replacingOccurrences(of: kataKotor, with: ",", options: NSString.CompareOptions.literal, range: nil)
                }
                print(newKataKotor)
                history.setValue(newKataKotor, forKey: "kataKotor")
                contextService.saveChanges()
            }
        }
    }
    
    
    func deleteHistory(_ history : History) {
        KataKotorService().minusTotalKataKotor(history.kataKotor!)
        contextService.deleteHistory(history)
    }
    
    
}
