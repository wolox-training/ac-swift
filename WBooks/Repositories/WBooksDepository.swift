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
    func fetchEntities(page: Int) -> SignalProducer<[Book], RepositoryError>
}

class WBooksDepository: AbstractRepository, LibraryRepositoryType {
    private static let EntitiesPath = "books"
    private static let CommentsPath = "comments"
    private static let PageKey = "page"
    private static let LibraryPageSize = 10
    
    public func fetchEntities(page: Int) -> SignalProducer<[Book], RepositoryError> {
        
        let path = WBooksDepository.EntitiesPath
        let parameters = [WBooksDepository.PageKey: page, "amount": WBooksDepository.LibraryPageSize]
        return performRequest(method: .get, path: path, parameters: parameters) {
            decode($0).toResult()
        }
    }

    public func fetchEntities(bookID: Int) -> SignalProducer<[Comment], RepositoryError> {
        let path = WBooksDepository.EntitiesPath + "/\(bookID)/" + CommentRepository.CommentsPath
        return performRequest(method: .get, path: path, parameters: nil) {
            decode($0).toResult()
        }
    }
}
