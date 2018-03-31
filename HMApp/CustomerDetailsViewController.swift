//
//  CustomerDetailsViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/23/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class CustomerDetailsViewController: UIViewController {
    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var cview: UITextView!

    @IBAction func fnBack(_ sender: UIBarButtonItem) {
          dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var clbl: UILabel!
    @IBOutlet weak var calbl: UILabel!
    @IBOutlet weak var cidlbl: UILabel!
    @IBOutlet weak var cnametxt: UILabel!
    @IBOutlet weak var cidtxt: UILabel!
    @IBOutlet weak var cphonetxt: UILabel!
    
    @IBOutlet weak var caddtxt: UILabel!
    @IBOutlet weak var cplbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        cnametxt.text = GlobalObjects.selectedCustomer?.name
        caddtxt.text = GlobalObjects.selectedCustomer?.address
        cidtxt.text = GlobalObjects.selectedCustomer?.id
        cphonetxt.text = GlobalObjects.selectedCustomer?.phone
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
