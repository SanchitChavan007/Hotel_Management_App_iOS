//
//  Booking+CoreDataProperties.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//
//

import Foundation
import CoreData


extension Booking {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Booking> {
        return NSFetchRequest<Booking>(entityName: "Booking")
    }

    @NSManaged public var fromDate: Date
    @NSManaged public var name: String
    @NSManaged public var toDate: Date
    @NSManaged public var customer: Customer
    @NSManaged public var room: Room

}
