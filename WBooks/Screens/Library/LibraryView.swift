//
//  TableView.swift
//  WBooks
//
//  Created by Ariel Cid on 3/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class LibraryView: UIView, NibLoadable {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        tableView.estimatedRowHeight = 90
        tableView.rowHeight = 90
        
        tableViewLabel.text = "LIBRARY"
        tableViewLabel.textColor = .white
        tableViewLabel.font = .systemBold()
        tableViewLabel.font.withSize(17)
    }
}
