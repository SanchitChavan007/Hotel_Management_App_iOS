//
//  SearchByCustomerViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class SearchByCustomerViewController: UIViewController {
    
    @IBOutlet weak var fnBack: UIBarButtonItem!
    
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var textCName: UITextField!
    @IBOutlet weak var labelCNaem: UILabel!
    @IBAction func fnSearch(_ sender: UIButton) {
        if checkCustomer(c:textCName.text!){
            
            
            for booking in GlobalObjects.bookingArray{
                if booking.customer.name==textCName.text{
                    GlobalObjects.searchResult.append(booking)
                }
                
            }
          
            
        }
        else{
            throwAlert(reason: "No Such Customer!")
        }
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        GlobalObjects.searchResult.removeAll()
        
        
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
    func checkCustomer(c:String)->Bool{
        for customer in GlobalObjects.customerArray{
            if (c == customer.name)
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





