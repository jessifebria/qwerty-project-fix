//
//  KataKotor+CoreDataProperties.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 03/09/21.
//
//

import Foundation
import CoreData


extension KataKotor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<KataKotor> {
        return NSFetchRequest<KataKotor>(entityName: "KataKotor")
    }

    @NSManaged public var kata: String?
    @NSManaged public var total: Int16

}

extension KataKotor : Identifiable {

}
