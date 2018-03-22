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
    
    fileprivate let _libraryRepository: LibraryRepositoryType
    
    init(libraryRepository: LibraryRepositoryType = NetworkingBootstrapper.shared.createLibraryRepository()) {
        _libraryRepository = libraryRepository
        
        books <~ _libraryRepository.fetchEntities()
            .map { $0.map { BookViewModel(book: $0) }}
            .liftError()
    }
    
}
