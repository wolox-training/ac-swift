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

class LibraryViewModel {
    
    let books = MutableProperty<[BookViewModel]>([])
    var currentPage = 1
    
    fileprivate let _libraryRepository: LibraryRepositoryType
    
    init(libraryRepository: LibraryRepositoryType = NetworkingBootstrapper.shared.createLibraryRepository()) {
        _libraryRepository = libraryRepository
    }
    
    public func expandBooks() {
        _libraryRepository.fetchEntities(page: currentPage)
            .map { $0.map { BookViewModel(book: $0) }}
            .startWithResult { [unowned self] result in
                switch result {
                case .success(let bookViewModels):
                    self.books.value += bookViewModels
                    if bookViewModels.count > 0 {
                        self.currentPage += 1
                    }
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}
