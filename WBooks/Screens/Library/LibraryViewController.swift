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
    
    init() {
        _viewModel = LibraryViewModel()
        
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
        setupNavBar()
        _viewModel.expandBooks()
    }

    fileprivate func setupBindings() {
        _viewModel.books.producer.startWithResult { [unowned self] _ in
            self._view.tableView.reloadData()
        }
    }
    
    private func setupNavBar() {
        title = "library.nav-bar.title".localized()
        
        let navBar = navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemBold().withSize(17)]  // swiftlint:disable:this line_length
        navBar?.isTranslucent = true
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_search"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightButtonSelector(selector:)))    // swiftlint:disable:this line_length
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "ic_notifications"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(leftButtonSelector(selector:)))   // swiftlint:disable:this line_length
        navigationItem.leftBarButtonItem?.tintColor = UIColor.white
    }
    
    @objc func rightButtonSelector(selector: UIBarButtonItem) {
        print("Search!")
    }
    
    @objc func leftButtonSelector(selector: UIBarButtonItem) {
        print("Notify!")
    }
    
}

// MARK: - Table View delegate
extension LibraryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.books.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: LibraryCellView.self, for: indexPath)!

        let bookViewModel: BookViewModel = _viewModel.books.value[indexPath.row]

        cell.bookTitle.text = bookViewModel.title
        cell.bookAuthor.text = bookViewModel.author
        bookViewModel.getImage { cell.bookCover.image = $0 }
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // swiftlint:disable:next line_length
        navigationController?.pushViewController(BookDetailViewController(_viewModel.books.value[indexPath.row]), animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if _view.tableView.contentOffset.y + _view.tableView.frame.height + 200 >= _view.tableView.contentSize.height {
            _viewModel.expandBooks()
        }
    }
}
