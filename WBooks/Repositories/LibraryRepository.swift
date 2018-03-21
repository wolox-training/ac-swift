//
//  LibraryRepository.swift
//  WBooks
//
//  Created by Ariel Cid on 3/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Argo
import Result

protocol LibraryRepositoryType {
    
    func fetchEntities() -> SignalProducer<[Book], RepositoryError>
    
}

class LibraryRepository: AbstractRepository, LibraryRepositoryType {
    
    private static let EntitiesPath = "books"
    private static let PageKey = "page"
    
    public func fetchEntities() -> SignalProducer<[Book], RepositoryError> {
        let path = LibraryRepository.EntitiesPath
        return performRequest(method: .get, path: path) {
            decode($0).toResult()
        }
    }
    
}
