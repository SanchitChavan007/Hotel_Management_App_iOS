//
//  RoomTableViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/23/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class RoomTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    tableView.delegate = self
        tableView.dataSource = self
        let fetchRequest: NSFetchRequest<Room> = Room.fetchRequest()
        
        do {
            let room = try PersistenceService.context.fetch(fetchRequest)
            GlobalObjects.roomArray = room
          
        }catch {
            
        }
        // Do any additional setup after loading the view.
    }
  
    @IBOutlet weak var backBtn: UIBarButtonItem!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return GlobalObjects.roomArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "roomCell")
            as! RoomTableViewCell
        
        cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
        // Configure the cell...
        
        cell.rLabel.text = GlobalObjects.roomArray[indexPath.row].name
        cell.rImage.image = UIImage(named: GlobalObjects.roomArray[indexPath.row].type )
        cell.rImage.layer.cornerRadius = cell.rImage.frame.height / 2
        cell.rImage.layer.masksToBounds = true
        return cell
    }
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var rTableView: UITableView!
    @IBOutlet weak var navbar: UINavigationBar!
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        GlobalObjects.selectedRoom = GlobalObjects.roomArray[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
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
