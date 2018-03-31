//
//  CreateRoomController.swift

//
//  Created by Sanchit Chavan on 3/3/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class CreateRoomViewController: UIViewController {
    @IBOutlet weak var textType: UITextField!
    
    
    @IBOutlet weak var buttonSubmit: UIButton!
    @IBOutlet weak var textPrice: UITextField!
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var labelRPrice: UILabel!
    @IBOutlet weak var labelRName: UILabel!
 
    @IBAction func fnSubmit(_ sender: UIButton) {
        for roo in GlobalObjects.roomArray{
            if textName.text == roo.name{
                throwAlert(reason: "Room already exists")
                textName.text=""
                return
            }
        }
        if (textName.text?.isEmpty)! {
            self.throwAlert(reason: "Enter the Room Name")
            
        }else if (textType.text?.isEmpty)!{
            
            self.throwAlert(reason: "Enter the Room Occupancy")
        }else if (textPrice.text?.isEmpty)!{
            
            self.throwAlert(reason: "Enter Room Price")
            
        }
        else if(((textType.text!=="s")||(textType.text!=="S")||(textType.text!=="D")||(textType.text!=="d"))==false){
            throwAlert(reason: "Incorrect Room Type")
        }
        else if (checkPrice(value: textPrice.text!)==false){
            throwAlert(reason: "Price can only be Integers!")
            
        }
        else
        {
            createRoom()
            textName.text=""
            textType.text=""
            textPrice.text=""
            
        }
        
    }
    @IBOutlet weak var labelRtype: UILabel!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var nav: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        
        do {
            let room = try PersistenceService.context.fetch(fetchRequest)
            GlobalObjects.roomArray = room
            for r in GlobalObjects.roomArray
            {
                print("printing rooms")
                print(r.name)
            }
        }catch {
            
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createRoom(){
        // let room = GlobalController.Room()
        let room  = Room(context: PersistenceService.context)
        room.name = textName.text!
        room.type = textType.text!
        room.price = Double(textPrice.text!)!
        GlobalObjects.roomArray.append(room)
        PersistenceService.saveContext()
        for r in GlobalObjects.roomArray{
            
            print(r.name)
        }
        self.throwAlert(reason: "Room Created Successfully")
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
    @objc func checkPrice(value: String) -> Bool {
        let pregex = "[0-9]{1,5}"
        let priceTest = NSPredicate(format: "SELF MATCHES %@", pregex)
        let result =  priceTest.evaluate(with: value)
        return result
    }
}


