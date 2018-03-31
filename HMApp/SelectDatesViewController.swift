//
//  CreateBookingController.swift
//  HotelManagementUsingIBController
//
//  Created by Sanchit Chavan on 3/3/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class SelectDatesViewController: UIViewController {
    var displayRooms: String = ""
    
    
    
    
    @IBOutlet weak var buttonSubmit: UIButton!
    
    @IBOutlet weak var EndDate: UILabel!
    @IBOutlet weak var startDate: UILabel!
    @IBOutlet weak var nav: UINavigationBar!
    

    @IBOutlet weak var btnBack: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let date = Date()
        fromDatePick.minimumDate = date
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var fromDatePick: UIDatePicker!
    
    @IBOutlet weak var toDatePick: UIDatePicker!
    func submitDates() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let fromDate: String? = dateFormatter.string(from: fromDatePick.date)
        let fDate = dateFormatter.date(from: fromDate!)
        let toDate: String? = dateFormatter.string(from: toDatePick.date)
        let tDate = dateFormatter.date(from: toDate!)
        
        if checkValidDate(toUser: fDate!, fromUser: tDate!){
            if((GlobalObjects.customerArray.isEmpty)||(GlobalObjects.roomArray.isEmpty)){
                self.throwAlert(reason: "No customer or rooms to create a booking, please add the same")
                print("in check if rooms cus empty")
                
            }
            else if checkValidDate(toUser: fDate!, fromUser: tDate!)
            {
                
                print("dates valid")
                for r in GlobalObjects.roomArray{
                    print("finding rooms")
                    if r.occupancy
                    {
                        
                        for b in Array(Set(GlobalObjects.bookingArray)){
                            print("in rooms set concept")
                            if r === b.room
                            {
                                
                                if fDate != b.fromDate && fDate != b.toDate && tDate != b.fromDate && fDate != b.toDate
                                {
                                    if tDate! < b.fromDate  //booking before existing booking
                                    {
                                        print(b.room.name)
                                        print("In  booking before existing date")
                                        displayRooms += "  \(b.room.name)"
                                        
                                    }else if fDate! > b.toDate
                                    {
                                        print(b.room.name)
                                        print("in booking after existing booking")
                                        displayRooms += "  \(b.room.name)"
                                        
                                    }
                                }
                            }
                        }
                    }else
                    {
                        print("Available rooms are as follows:")
                        
                        displayRooms += "  \(r.name)"
                        
                    }
                    
                }
                print(displayRooms)
                
                GlobalObjects.x=displayRooms
                displayRooms = ""
            }
            
        }
            
        else
        {
            self.throwAlert(reason: "Enter Valid Dates")
            
        }
    }
    
    @IBAction func fnSubmit(_ sender: UIButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        GlobalObjects.fDate = dateFormatter.string(from: fromDatePick.date)
        GlobalObjects.tDate = dateFormatter.string(from: toDatePick.date)
        
        submitDates()
        
        if GlobalObjects.x == ""{
            throwAlert(reason: "No Rooms Available")
        }
      
    }
    
    func checkValidDate(toUser: Date, fromUser: Date) -> Bool
    {
        if toUser.compare(fromUser) == .orderedAscending
        {
            
            return true
            
        }else
        {
            return false
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    func throwAlert(reason :String){
        let alert = UIAlertController(title: "Hotel Management App", message:reason , preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

