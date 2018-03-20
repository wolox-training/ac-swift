//
//  TableViewModel.swift
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
    
    fileprivate let _libraryRepository: LibraryRepositoryType
    
    init(libraryRepository: LibraryRepositoryType = NetworkingBootstrapper.shared.createLibraryRepository()) {
        _libraryRepository = libraryRepository
        
//        _libraryRepository.fetchEntities()
//            .map { $0.map { BookViewModel(book: $0) } }
//            .startWithResult { [unowned self] result in
//                switch result {
//                case .success(let bookViewModels):
//                    self.books.value = bookViewModels
//
//                case .failure(let error):
//                    print(error)
//                }
//            }
        
        books <~ _libraryRepository.fetchEntities()
            .map { $0.map { BookViewModel(book: $0) }}
//            .map { books in
//                books.map { book in
//                    BookViewModel(book: book)
//                }
//            }
            .liftError()
    }
    
}
