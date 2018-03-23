//
//  SuggestViewController.swift
//  WBooks
//
//  Created by Ariel Cid on 3/21/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import Core
import Utils

class SuggestViewController: UIViewController {

    fileprivate let _view: SuggestView = SuggestView.loadFromNib()!
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = _view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
