//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 3/28/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import Networking
import Result

class BookDetailViewModel {

    let comments: Property<[CommentViewModel]>

    fileprivate let _comments = MutableProperty<[CommentViewModel]>([])
    fileprivate let _bookViewModel: BookViewModel
    fileprivate let _wBooksDepository: WBooksDepositoryType

    var bookViewModel: BookViewModel {
        return _bookViewModel
    }

    // swiftlint:disable:next line_length
    init(_ bookViewModel: BookViewModel, _ wBooksDepository: WBooksDepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        _wBooksDepository = wBooksDepository
        _bookViewModel = bookViewModel
        comments = Property(_comments)
    }

    public func getComments() {
        _wBooksDepository.fetchEntities(bookID: _bookViewModel.id)
            .map { (values: [Comment]) -> [CommentViewModel] in
                return values.map { CommentViewModel(comment: $0) }
            }
            .startWithResult { [unowned self] result in
                switch result {
                case .success(let commentViewModels):
                    self._comments.value = commentViewModels

                case .failure(let error):
                    print(error)
                }
        }
    }
}
