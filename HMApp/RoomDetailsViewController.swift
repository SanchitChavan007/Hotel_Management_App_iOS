//
//  RoomDetailsViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/23/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class RoomDetailsViewController: UIViewController {

    @IBOutlet weak var backBtn: UIBarButtonItem!
    @IBOutlet weak var rview: UITextView!
    
    @IBAction func fnBack(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var rlbl: UILabel!
    @IBOutlet weak var rtlbl: UILabel!
    @IBOutlet weak var rplbl: UILabel!
    @IBOutlet weak var rnametxt: UILabel!
    @IBOutlet weak var rtypetxt: UILabel!
    @IBOutlet weak var rpricetxt: UILabel!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        rnametxt.text = GlobalObjects.selectedRoom?.name
        rtypetxt.text = GlobalObjects.selectedRoom?.type
        rpricetxt.text = String(describing: GlobalObjects.selectedRoom?.price)
       
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

