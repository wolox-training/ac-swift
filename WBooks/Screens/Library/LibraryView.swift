//
//  LibraryView.swift
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .polar()
        tableView.backgroundColor = .polar()
    }
}
