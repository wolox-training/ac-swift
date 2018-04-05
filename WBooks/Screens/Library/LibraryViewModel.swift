//
//  LibraryViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 3/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import Networking
import Result

class LibraryViewModel {
    
    let books: Property<[BookViewModel]>
    
    fileprivate let _books = MutableProperty<[BookViewModel]>([])
    fileprivate let _wBooksRepository: WBooksDepositoryType
    fileprivate var _currentPage = 1
    
    init(wBooksDepository: WBooksDepositoryType = NetworkingBootstrapper.shared.createWBooksRepository()) {
        _wBooksRepository = wBooksDepository
        books = Property(_books)
    }
    
    public func expandBooks() {
        _wBooksRepository.fetchEntities(page: _currentPage)
            .map { $0.map { BookViewModel(book: $0) }}
            .startWithResult { [unowned self] result in
                switch result {
                case .success(let bookViewModels):
                    self._books.value += bookViewModels
                    if bookViewModels.count > 0 {
                        self._currentPage += 1
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
