//
//  BookDetailComponentViewController
//  WBooks
//
//  Created by Ariel Cid on 3/28/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import UIKit
import Core
import Utils

class BookDetailComponentViewController: UIViewController {

    fileprivate let _view: BookDetailComponentView = BookDetailComponentView.loadFromNib()!

    init(bookViewModel: BookViewModel) {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = _view
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        _view.setGradients()
    }

}
