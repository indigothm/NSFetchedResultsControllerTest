//
//  ToDoTableViewCell.swift
//  NSFetchedResultsControllerTest
//
//  Created by Ilia Tikhomirov on 29/01/16.
//  Copyright © 2016 Ilia Tikhomirov. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
