//
//  SearchByDateViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class SearchByDateViewController: UIViewController {
    @IBOutlet weak var back: UIBarButtonItem!
   
    @IBOutlet weak var buttonSearch: UIButton!
    //    @IBOutlet weak var textDate: UITextField!
    @IBOutlet weak var labelByDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalObjects.searchResult.removeAll()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var fromDatePick: UIDatePicker!
    
    @IBAction func fnSearch(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let fromDate: String? = dateFormatter.string(from: fromDatePick.date)
        let fDate = dateFormatter.date(from: fromDate!)
        
        if(checkDate(c:fDate!)){
            
            for booking in GlobalObjects.bookingArray{
                
                if (booking.fromDate==fDate){
                    GlobalObjects.searchResult.append(booking)
                }
                
                
            }
            
            
        }
        else{
            throwAlert(reason: "No Bookings on given date!")
        }
        
        
    }
    
    
    
    
    func checkDate(c:Date)->Bool{
        for booking in GlobalObjects.bookingArray{
            if (c == booking.fromDate)
            {
                return true
                
            }
            
        }
        return false
    }
    func throwAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management App", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
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

