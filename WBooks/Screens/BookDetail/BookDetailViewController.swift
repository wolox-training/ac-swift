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
    fileprivate let _viewModel: BookDetailViewModel
    
    init(bookViewModel: BookViewModel) {
        _viewModel = BookDetailViewModel(bookViewModel: bookViewModel)

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

        _view.tableView.delegate = self
        _view.tableView.dataSource = self
        //  _view.tableView.register(cell: LibraryCellView.self)
        
        let navBar = navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemBold().withSize(17)]  // swiftlint:disable:this line_length
        navBar?.isTranslucent = true
    }
    
}

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*
        let cell = tableView.dequeue(cell: LibraryCellView.self, for: indexPath)!

        cell.setCellData(bookViewModel: _viewModel.books.value[indexPath.row])
        */
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return BookDetailComponentView.loadFromNib()!
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 270
    }
}
