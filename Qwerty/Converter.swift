//
//  Converter.swift
//  Qwerty
//
//  Created by Yafonia Hutabarat on 07/04/21.
//

import Foundation

class Converter {
    
    static func convertDateToStringYearDateHourMinute(date: Date) -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "d MMM yyyy, HH:mm"

        return dateFormatter.string(from: date)
    }
    
    static func convertDateToStringDateHourMinute(date: Date) -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "d MMM, HH:mm"

        return dateFormatter.string(from: date)
    }
    
    
    static func convertDateToStringHourMinute(date: Date) -> String {
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "HH:mm"

        return dateFormatter.string(from: date)
    }
    
    static func convertDateToLocaleDate(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "EEEEEE, d MMM yyyy"

        return dateFormatter.string(from: date)
    }
    
    static func replaceCommaToArray(kataKotor: String) -> [String] {
        var array = kataKotor.components(separatedBy: ",")
        var newArray = [String]()
        array.remove(at: 0)
        array.remove(at: array.count - 1)
        for i in 0...array.count - 1 {
            newArray.append(array[i].replacingOccurrences(of: " ", with: ""))
        }
        return newArray
    }
    
    static func addCommaFromArrayToString(kataKotor: [String]) -> String {
        return kataKotor.joined(separator: ", ")
        
    }
    
    static func convertDateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        
        return dateFormatter.string(from: date)
    }
    
    static func convertStringToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: "2015-04-01T11:42:00")! // replace Date String
    }
}

