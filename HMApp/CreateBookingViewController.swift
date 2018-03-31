//
//  CreateFinalBookingController.swift
//  HotelManagementUsingIBController
//
//  Created by Sanchit Chavan on 3/3/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class CreateBookingViewController: UIViewController {
    @IBOutlet weak var labelAvail: UILabel!
    
    @IBOutlet weak var textCName: UITextField!
    @IBOutlet var labelCName: UIView!
    @IBAction func fnBack(_ sender: UIBarButtonItem) {
        textView.text = ""
        GlobalObjects.x = ""
        dismiss(animated: true, completion: nil)
        
    }
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var nav: UINavigationBar!
    @IBOutlet weak var labelEnter: UILabel!
    
    @IBOutlet weak var labelBNAme: UILabel!
    @IBOutlet weak var textRoomName: UITextField!
    @IBOutlet weak var textBName: UITextField!
    
    @IBAction func fnSubmit(_ sender: UIButton) {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let fromDate: String? = GlobalObjects.fDate
        let fDate = dateFormatter.date(from: fromDate!)
        let toDate: String? = GlobalObjects.tDate
        let tDate = dateFormatter.date(from: toDate!)
        var room_name=textRoomName.text!
        if checkRoom(r:room_name)==false{
            throwAlert(reason: "Please enter correct Room!")
            textRoomName.text=""
            return
        }
        var customer_name: String? = textCName.text!
        if checkCust(c:customer_name!)==false{
            throwAlert(reason: "No such customer")
            return
        }
        
        if textBName.text==""{
            throwAlert(reason: "Please provide a booking name")
            return
        }
        
        textView.text=""
        
        let booking = Booking(context: PersistenceService.context)
        booking.name = textBName.text!
        booking.fromDate = fDate!
        booking.toDate = tDate!
        
        
        for room in GlobalObjects.roomArray{
            if  room.name == room_name
            {
                room.occupancy = true
                booking.room = room
                //setting occupancy of a room true in roomArray
                
                
                GlobalObjects.bookingArray.append(booking)
                
                
            }
        }
        for cust in GlobalObjects.customerArray{
            if cust.name == customer_name!
            {
                booking.customer = cust
                self.throwAlert(reason: "Your Room is Booked")
                
                
            }
        }
        
        //     booking.customer?.name = textCName.text!
        PersistenceService.saveContext()
        GlobalObjects.bookingArray.append(booking)
        GlobalObjects.x = ""
        textView.text = ""
        textCName.text=""
        textRoomName.text=""
        textBName.text=""
        throwAlert(reason: "Booking Completed Successfully!")
        
        
    }
    @IBOutlet weak var buttonSubmit: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.text=GlobalObjects.x
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func checkRoom(r:String) -> Bool{
        for room in GlobalObjects.roomArray{
            if(r==room.name)
            {
                return true
            }
            
        }
        return false
    }
    func checkCust(c:String) -> Bool{
        for cust in GlobalObjects.customerArray{
            if(c==cust.name)
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
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}

