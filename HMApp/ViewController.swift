//
//  ViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fetchRequest1: NSFetchRequest<Customer> = Customer.fetchRequest()
        
        do {
            let customer = try PersistenceService.context.fetch(fetchRequest1)
            GlobalObjects.customerArray = customer
            for c in GlobalObjects.customerArray
            {
                print("Hello")
                print(c.name)
            }
        }catch {
            
        }
        
        let fetchRequest2: NSFetchRequest<Room> = Room.fetchRequest()
        
        do {
            let room = try PersistenceService.context.fetch(fetchRequest2)
            GlobalObjects.roomArray = room
            for r in GlobalObjects.customerArray
            {
                print("Hello")
                print(r.name)
            }
        }catch {
            
        }
        
        let fetchRequest3: NSFetchRequest<Booking> = Booking.fetchRequest()
        
        do {
            let bk = try PersistenceService.context.fetch(fetchRequest3)
            GlobalObjects.bookingArray = bk
            for bkg in GlobalObjects.customerArray
            {
                print("Hello")
                print(bkg.name)
            }
        }catch {
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

