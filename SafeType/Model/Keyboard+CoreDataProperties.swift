//
//  Keyboard+CoreDataProperties.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 03/09/21.
//
//

import Foundation
import CoreData


extension Keyboards {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Keyboard> {
        return NSFetchRequest<Keyboard>(entityName: "Keyboard")
    }

    @NSManaged public var isFullAccess: Bool
    @NSManaged public var lastSeen: Date?

}

extension Keyboard : Identifiable {

}
