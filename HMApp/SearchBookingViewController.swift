//
//  SearchBookingViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class SearchBookingViewController: UIViewController {
    @IBOutlet weak var nav: UINavigationBar!
    @IBOutlet weak var btnBack: UIBarButtonItem!
    @IBOutlet weak var btnByBooking: UIButton!
    @IBOutlet weak var btnByDate: UIButton!
    @IBOutlet weak var btnByCName: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<Booking> = Booking.fetchRequest()
        
        do {
            let bookingArray = try PersistenceService.context.fetch(fetchRequest)
            GlobalObjects.bookingArray = bookingArray
            
        }catch {
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

