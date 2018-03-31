//
//  Customer+CoreDataProperties.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var address: String
    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var phone: String

}
