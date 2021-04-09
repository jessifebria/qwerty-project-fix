//
//  DateExtension.swift
//  Qwerty
//
//  Created by Jessi Febria on 08/04/21.
//

import UIKit

extension Date {
    var startOfWeek: Date? {
        let gregorian = Calendar(identifier: .gregorian)
        guard let sunday = gregorian.date(from: gregorian.dateComponents([.yearForWeekOfYear, .weekOfYear], from: self)) else { return nil }
        return gregorian.date(byAdding: .day, value: 1, to: sunday)
    }
    var startOfMonth: Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year, .month], from: self)

        return  calendar.date(from: components)!
    }
    var startOfYear: Date {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar.dateComponents([.year], from: self)

        return  calendar.date(from: components)!
    }
    var startOfDay: Date {
        let calendar = Calendar.current
        let startTime = calendar.startOfDay(for: Date())
        
        return startTime
    }
}
