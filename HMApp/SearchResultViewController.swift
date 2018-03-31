//
//  SearchResultViewController.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/20/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit
import CoreData

class SearchResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var nav: UINavigationBar!
    @IBAction func fnBack(_ sender: UIBarButtonItem) {
     GlobalObjects.searchResult.removeAll()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        print(" SR1")
        print("Printing search results")
        for s in GlobalObjects.searchResult{
         
            print(s.name)
        }
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
        print(" SR2")
        return (GlobalObjects.searchResult.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        print(" SR3")
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "tableView")
        
    
        cell.textLabel?.text = "| Booking Name: \(GlobalObjects.searchResult[indexPath.row].name)|Room: \(GlobalObjects.searchResult[indexPath.row].room.name) | "
        return(cell)
    }
}

