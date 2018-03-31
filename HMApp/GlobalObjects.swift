//
//  GlobalObjects.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import Foundation
import UIKit

class GlobalObjects: NSObject {
    static var x: String = ""
    static var fDate: String = ""
    static var tDate: String = ""
    static var customerArray: [Customer] = []
    static var roomArray: [Room] = []
    static var bookingArray: [Booking] = []
    static var searchResult: [Booking] = []
    static var selectedCustomer: Customer? = nil
    static var selectedRoom : Room? = nil
    static var selectedBooking : Booking? = nil
    static var filteredBooking : [Booking] = []
      static var filteredCustomers : [Customer] = []
}
