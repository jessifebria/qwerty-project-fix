//
//  KataKotor+CoreDataProperties.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 03/09/21.
//
//

import Foundation
import CoreData


extension KataKotors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KataKotor> {
        return NSFetchRequest<KataKotors>(entityName: "KataKotor")
    }

    @NSManaged public var kata: String?
    @NSManaged public var total: Int16

}

extension KataKotors : Identifiable {

}
