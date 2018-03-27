//
//  BookDetailViewController
//  WBooks
//
//  Created by Ariel Cid on 3/26/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import Core
import Utils

class BookDetailViewController: UIViewController {

    fileprivate let _view: BookDetailView = BookDetailView.loadFromNib()!
    
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
        
        let navBar = navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemBold().withSize(17)]  // swiftlint:disable:this line_length
        navBar?.isTranslucent = true
    }
    
}
