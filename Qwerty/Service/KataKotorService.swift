//
//  KataKotorController.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import CoreData
import UIKit

class KataKotorService {
    
    let historyService = HistoryService()
    let contextService = ContextService()
    
    func getAllKataKotor() -> [KataKotor]{
        let request : NSFetchRequest<KataKotor> = KataKotor.fetchRequest()
        return contextService.loadKataKotor(request)
    }
    
    func getUniqueKataKotor(filter : String) -> ( listKataKotor : [KataKotorRiwayat], countTotal : Int ){
        let request : NSFetchRequest<KataKotor> = KataKotor.fetchRequest()
        request.predicate = NSPredicate(format: "total > 0")
        let kataKotorArray : [KataKotor] = contextService.loadKataKotor(request)
        
        var result : [KataKotorRiwayat] = [KataKotorRiwayat]()
        var count = 0
    
        if filter == "All" {
            for kata in kataKotorArray {
                let newKata = KataKotorRiwayat(kata: kata.kata!, total: Int(kata.total))
                count += Int(kata.total)
                result.append(newKata)
            }
            return (result, count)
        }
        
        for kata in kataKotorArray {
            let histories = historyService.getHistoryByKataKotor(kataKotor: kata.kata! , filter: filter)
            var resultCount = 0
            if histories.count > 0 {
                for history in histories {
                    let historyKataKotor = history.kataKotor!
                    let countKataKotor = historyKataKotor.components(separatedBy: kata.kata!.capitalized).count - 1
                    resultCount += countKataKotor
                }
                let newKata = KataKotorRiwayat(kata: kata.kata!, total: resultCount)
                result.append(newKata)
                count += resultCount
            }
        }
        
        return (result, count)
    }
    
    func deleteKataKotor(_ kataKotor : KataKotor){
        historyService.updateHistoryByKataKotor(kataKotor.kata!)
        contextService.deleteKataKotor(kataKotor)
        
    }
    
    func addKataKotor(_ kata : String){
        let newKataKotor = KataKotor(context: contextService.context)
        newKataKotor.kata = kata
        newKataKotor.total = 0
        
        contextService.saveChanges()
        
    }
    
    
    func loadKataKotor(){
        let csvPath = Bundle.main.path(forResource: "KataKotor", ofType: "csv")

        if csvPath == nil {
            return
        }
       
        var csvData: String? = nil
       
        do {
            csvData = try String(contentsOfFile: csvPath!, encoding: String.Encoding.utf8)
            let csv = csvData?.components(separatedBy: "\n")
            for row in csv!{
                print(row)
                let newKataKotor = KataKotor(context: contextService.context)
                newKataKotor.kata = row.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                contextService.saveChanges()
            }
       
        } catch{
            print(error)
        }
        
     }
     
    
    func minusTotalKataKotor(_ kalimat : String) {
        
        let kataArray = kalimat.components(separatedBy: " ")
        
        for i in 1...kataArray.count - 1 {
            var kata = kataArray[i]
            kata.remove(at: kata.index(before: kata.endIndex))
            
            let request : NSFetchRequest<KataKotor> = KataKotor.fetchRequest()
            
            request.predicate = NSPredicate(format: "kata MATCHES[cd] %@", kata)
            
            let kataObject = contextService.loadKataKotor(request)[0]
            let newTotal = kataObject.total - 1
            kataObject.setValue(newTotal, forKey: "total")
            contextService.saveChanges()
        }
    }
    
    
}
