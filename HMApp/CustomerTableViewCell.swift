//
//  CustomerTableViewCell.swift
//  HMApp
//
//  Created by Sanchit Chavan on 3/21/18.
//  Copyright © 2018 Sanchit Chavan. All rights reserved.
//

import UIKit

class CustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UITableViewCell!
    
    @IBOutlet weak var cLabel: UILabel!
    @IBOutlet weak var cImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
