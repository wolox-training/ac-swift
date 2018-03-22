//
//  LibraryViewController.swift
//  WBooks
//
//  Created by Guido Marucci Blas on 4/3/16.
//  Copyright © 2016 Wolox. All rights reserved.
//

import UIKit
import Core
import Utils

class LibraryViewController: UIViewController {

    fileprivate let _view: LibraryView = LibraryView.loadFromNib()!
    fileprivate let _viewModel: LibraryViewModel
    
    init(viewModel: LibraryViewModel) {
        _viewModel = viewModel
        
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
        _view.tableView.register(cell: LibraryCellView.self)
        
        setupBindings()
    }

    fileprivate func setupBindings() {
        _viewModel.books.producer.startWithResult { [unowned self] _ in
            self._view.tableView.reloadData()
        }
    }
    
}

// MARK: - Table View delegate
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: LibraryCellView.self, for: indexPath)!
        
        cell.setCellData(bookViewModel: _viewModel.books.value[indexPath.row])
        
        return cell
    }
    
}
