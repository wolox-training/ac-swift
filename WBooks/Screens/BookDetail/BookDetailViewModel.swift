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
    fileprivate let _commentRepository: CommentRepositoryType

    var bookViewModel: BookViewModel {
        return _bookViewModel
    }

    // swiftlint:disable:next line_length
    init(_ bookViewModel: BookViewModel, _ commentRepository: CommentRepositoryType = NetworkingBootstrapper.shared.createCommentRepository()) {
        _commentRepository = commentRepository
        _bookViewModel = bookViewModel
         comments = Property(_comments)
    }

    public func getComments() {
        _commentRepository.fetchEntities(bookID: _bookViewModel.id)
            .map { $0.map { CommentViewModel(comment: $0) }}
            .startWithResult { [unowned self] result in
                switch result {
                case .success(let commentViewModels):
                    self._comments.value += commentViewModels

                case .failure(let error):
                    print(error)
                }
        }
    }

}
