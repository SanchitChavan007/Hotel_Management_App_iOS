//
//  DisplayBookingController.swift
//  HotelManagementUsingIBController
//
//  Created by Sanchit Chavan on 3/3/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class BookingTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating {
    var searchController = UISearchController()
    var resultsController = UITableViewController()
   
    @IBOutlet weak var nav: UINavigationBar!
    
    @IBOutlet weak var tableView: UITableView!
    //    @IBOutlet weak var textView: UITextView!
 
    @IBOutlet weak var btnBack: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchController = UISearchController(searchResultsController: resultsController)
        GlobalObjects.filteredBooking = GlobalObjects.bookingArray
        resultsController.tableView.reloadData()
        for book in GlobalObjects.filteredBooking{
            print("start filtered booking")
            print(book.name)
        }
       
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        resultsController.tableView.delegate = self
        resultsController.tableView.dataSource = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tableView")
        self.tableView.reloadData()
        let fetchRequest3: NSFetchRequest<Booking> = Booking.fetchRequest()
        do {
            let bookingArray = try PersistenceService.context.fetch(fetchRequest3)
            GlobalObjects.bookingArray = bookingArray
            
        }catch {
            
        }
       
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        GlobalObjects.selectedBooking = GlobalObjects.filteredBooking[indexPath.row]
        performSegue(withIdentifier: "segue", sender: self)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        print("in update searchview")
        var tempArrayBooking: [String] = []
        for bk in GlobalObjects.bookingArray
        {
            tempArrayBooking.append(bk.name)
            
        }
        for t in tempArrayBooking{
            print("in temp booking array")
            print(t)
        }
        print(searchController.searchBar.text!)
        
        if searchController.searchBar.text!==""{
            GlobalObjects.filteredBooking = GlobalObjects.bookingArray
        }
        else{
            GlobalObjects.filteredBooking = GlobalObjects.bookingArray.filter({ ($0.name.lowercased().contains(searchController.searchBar.text!.lowercased()))})
         
        }
        for book in GlobalObjects.filteredBooking{
            print("in printing filtered booking")
                print(book.name)
        }
        print("b4 calling func-func")
        
       resultsController.tableView.reloadData()
        
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
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
       
        return GlobalObjects.filteredBooking.count

    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "tableView")
        cell.textLabel?.text = "| Booking Name: \(GlobalObjects.filteredBooking[indexPath.row].name)|Room: \(GlobalObjects.filteredBooking[indexPath.row].room.name) | "
        return(cell)
    }
    

}

