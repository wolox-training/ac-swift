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
    fileprivate var _bookComponentView: BookDetailComponentView?
    
    init(_ bookViewModel: BookViewModel) {
        _viewModel = BookDetailViewModel(bookViewModel)

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
        _view.tableView.register(cell: BookCommentCellView.self)

        setupBindings()
        setupNavBar()
        _viewModel.getComments()
    }

    override func viewDidAppear(_ animated: Bool) {
        _bookComponentView?.setGradients()
    }
}

extension BookDetailViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _viewModel.comments.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: BookCommentCellView.self, for: indexPath)!
        let commentViewModel: CommentViewModel = _viewModel.comments.value[indexPath.row]

        cell.userName.text = commentViewModel.user.firstName + " " + commentViewModel.user.lastName
        cell.userComment.text = commentViewModel.content
        commentViewModel.getImage { cell.userImage.image = $0 }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        _bookComponentView = BookDetailComponentView.loadFromNib()!

        _bookComponentView?.bookTitle.text = _viewModel.bookViewModel.title
        _bookComponentView?.bookYear.text = _viewModel.bookViewModel.year
        _bookComponentView?.bookGenre.text = _viewModel.bookViewModel.genre.capitalized
        _bookComponentView?.bookAuthor.text = _viewModel.bookViewModel.author
        _viewModel.bookViewModel.getImage { self._bookComponentView?.bookImage.image = $0 }
        
        return _bookComponentView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 280
    }
}

extension BookDetailViewController {

    private func setupNavBar() {
        let navBar = navigationController?.navigationBar
        navBar?.shadowImage = UIImage()
        navBar?.setBackgroundImage(UIImage(), for: .default)
        navBar?.isTranslucent = true
        navBar?.topItem?.title = ""
        navBar?.tintColor = .white
        
        navigationItem.title = "book-detail.nav-bar.title".localized()
    }

    fileprivate func setupBindings() {
        _viewModel.comments.producer.startWithResult { [unowned self] _ in
            self._view.tableView.reloadData()
        }
    }
}
