//
//  CreateCustomerViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class CreateCustomerViewController: UIViewController {

    @IBOutlet weak var nav: UINavigationBar!
    
    @IBAction func fnBack(_ sender: UIBarButtonItem) {
       
        
    }
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var btnSubmit: UIButton!
    @IBAction func fnSubmit(_ sender: UIButton) {
        if((textName.text?.isEmpty)!||(textPhone.text?.isEmpty)!||(textAddress.text?.isEmpty)!||(textPassport.text?.isEmpty)!)
        {
            self.throwAlert(reason: "Fields cannot be empty!")
            
        }
        else if (checkPhone(value: textPhone.text!)==false)
        {
            self.throwAlert(reason: "Please enter a valid 10 digit phone number")
            return
        }
        else if (checkPassport(value: textPassport.text!)==false)
        {
            self.throwAlert(reason: "Please enter a valid passport number")
            return
        }
        else
        {
            createCustomer()
            textName.text=""
            textPhone.text=""
            textPassport.text=""
            textAddress.text=""
        }
    }
    
    @IBOutlet weak var textAddress: UITextField!
    @IBOutlet weak var textPhone: UITextField!
    @IBOutlet weak var textPassport: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    @IBOutlet weak var labelPassport: UILabel!
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var buttonSubmit: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Validation functions
    
    @objc func checkPhone(value: String) -> Bool {
        let pregex = "[0-9]{10}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", pregex)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    @objc func checkPassport(value: String) -> Bool {
        let paregex = "[A-Z][0-9]{7,10}"
        let passTest = NSPredicate(format: "SELF MATCHES %@", paregex)
        let result =  passTest.evaluate(with: value)
        return result
    }
    
    //create customer function
    
    func createCustomer()
    {
        let customer  = Customer(context: PersistenceService.context)
        //let customer = GlobalController.Customer()
        customer.name = textName.text!
        customer.address = textAddress.text!
        customer.id = textPassport.text!
        customer.phone = textPhone.text!
        
        PersistenceService.saveContext()
        GlobalObjects.customerArray.append(customer)
        
        
        self.throwAlert(reason: "Customer Added Successfully!")
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

