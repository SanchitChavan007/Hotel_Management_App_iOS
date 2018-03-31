//
//  CustomerDetailsViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/23/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class BookingDetailsViewController: UIViewController {
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var bview: UITextView!
    

    @IBOutlet weak var blbl: UILabel!
    @IBOutlet weak var cnamelbl: UILabel!
    @IBOutlet weak var fromlbl: UILabel!
    @IBOutlet weak var bnametxt: UILabel!
    @IBOutlet weak var bcnametxt: UILabel!
    @IBOutlet weak var fromtxt: UILabel!
    
    @IBOutlet weak var totxt: UILabel!
    @IBOutlet weak var tolbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        bnametxt.text = GlobalObjects.selectedBooking?.name
        bcnametxt.text = GlobalObjects.selectedBooking?.customer.name
        fromtxt.text = String(describing: GlobalObjects.selectedBooking?.fromDate)
        totxt.text = String(describing: GlobalObjects.selectedBooking?.toDate)
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

