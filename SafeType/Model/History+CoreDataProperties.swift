//
//  History+CoreDataProperties.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 03/09/21.
//
//

import Foundation
import CoreData


extension History {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var kalimat: String?
    @NSManaged public var kataKotor: String?
    @NSManaged public var platform: String?
    @NSManaged public var waktu: Date?

}

extension History : Identifiable {

}
