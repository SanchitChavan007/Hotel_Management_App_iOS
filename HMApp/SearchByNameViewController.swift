//
//  SearchByNameViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class SearchByNameViewController: UIViewController {
    @IBOutlet weak var back: UIBarButtonItem!
   
    @IBOutlet weak var buttonSearch: UIButton!
    @IBOutlet weak var textBName: UITextField!
    @IBOutlet weak var labelBName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        GlobalObjects.searchResult.removeAll()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fnSearch(_ sender: UIButton) {
        if checkBName(c: textBName.text!)==false{
            throwAlert(reason: "No Such Booking!")
            return
        }
        
        for booking in GlobalObjects.bookingArray{
            if booking.name==textBName.text{
                GlobalObjects.searchResult.append(booking)
            }
            
        }
       
        
    }
    
    
    func checkBName(c:String)->Bool{
        for booking in GlobalObjects.bookingArray{
            
            if (c == booking.name)
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
}



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */



