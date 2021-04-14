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
    
    
    func createHistoryFakeData(){
        
        saveFakeData(kalimat: "Anjing lu babi", kataKotor: ", Anjing, Babi,", platform: "Mobile Legends", waktu: "2021-04-13 12:13:01")
        saveFakeData(kalimat: "Lonte", kataKotor: ", Lonte,", platform: "Mobile Legends", waktu: "2021-04-13 10:13:01")
        saveFakeData(kalimat: "fak lu", kataKotor: ", Fak,", platform: "WhatsApp", waktu: "2021-04-13 10:12:23")
        saveFakeData(kalimat: "bacot banget lu jadi orang", kataKotor: ", Bacot,", platform: "WhatsApp", waktu: "2021-04-12 09:13:01")
        saveFakeData(kalimat: "Tai asu", kataKotor: ", Tai, Asu,", platform: "Instagram", waktu: "2021-04-12 09:13:01")
        saveFakeData(kalimat: "kontol", kataKotor: ", Kontol,", platform: "Line", waktu: "2021-04-09 09:13:01")
        saveFakeData(kalimat: "kok lu bacot banget sih lu jadi orang, gua capek banget dengernya asu", kataKotor: ", Bacot, Asu,", platform: "Instagram", waktu: "2021-04-09 09:13:01")
        saveFakeData(kalimat: "duh anjing lu kampret bangsat", kataKotor: ", Anjing, Bangsat,", platform: "WhatsApp", waktu: "2021-04-09 12:13:12")
        saveFakeData(kalimat: "lu tuh kebanyakan ngomong njir pusing gua", kataKotor: ", Njir,", platform: "WhatsApp", waktu: "2021-04-08 08:23:12")
        
        
        saveFakeData(kalimat: "Brengsek lu babi", kataKotor: ", Brengsek, Babi,", platform: "Mobile Legends", waktu: "2021-03-13 12:13:01")
        saveFakeData(kalimat: "Tai lu fak", kataKotor: ", Tai, Fak,", platform: "Mobile Legends", waktu: "2021-03-13 12:11:01")
        saveFakeData(kalimat: "Tau lah serah lu aja gua gamau mikir lagi anjing babi fak", kataKotor: ", Anjing, Babi, Fak,", platform: "WhatsApp", waktu: "2021-03-13 12:13:01")
        saveFakeData(kalimat: "Asu", kataKotor: ", Asu,", platform: "Mobile Legends", waktu: "2021-03-13 14:13:01")
        saveFakeData(kalimat: "Fak", kataKotor: ", Fak,", platform: "Mobile Legends", waktu: "2021-03-12 12:15:01")
        saveFakeData(kalimat: "Fak", kataKotor: ", Fak,", platform: "Mobile Legends", waktu: "2021-03-12 18:24:01")
        saveFakeData(kalimat: "Fak", kataKotor: ", Fak,", platform: "Mobile Legends", waktu: "2021-03-11 17:12:45")
        saveFakeData(kalimat: "Fak", kataKotor: ", Fak,", platform: "Mobile Legends", waktu: "2021-03-10 20:34:14")
        saveFakeData(kalimat: "Fak", kataKotor: ", Fak,", platform: "Mobile Legends", waktu: "2021-03-10 21:45:36")
      
        KataKotorService().addCountToKataKotor("Anjing", 3)
        KataKotorService().addCountToKataKotor("Babi", 3)
        KataKotorService().addCountToKataKotor("Lonte", 1)
        KataKotorService().addCountToKataKotor("Fak", 8)
        KataKotorService().addCountToKataKotor("Bacot", 2)
        KataKotorService().addCountToKataKotor("Tai", 2)
        KataKotorService().addCountToKataKotor("Asu", 3)
        KataKotorService().addCountToKataKotor("Kontol", 1)
        KataKotorService().addCountToKataKotor("Bangsat", 1)
        KataKotorService().addCountToKataKotor("Njir", 1)
        KataKotorService().addCountToKataKotor("Brengsek", 1)
        
        
        contextService.saveChanges()
    }
    
    func saveFakeData(kalimat : String, kataKotor : String, platform : String, waktu : String){
        let newHistory = History(context: contextService.context)
        newHistory.kalimat = kalimat
        newHistory.kataKotor = kataKotor
        newHistory.platform = platform
        newHistory.waktu = Converter.convertStringToDate(dateInString: waktu)
    }
    
}
