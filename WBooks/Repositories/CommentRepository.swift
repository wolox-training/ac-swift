//
//  CommentRepository.swift
//  WBooks
//
//  Created by Ariel Cid on 4/4/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Networking
import ReactiveSwift
import Argo
import Result

protocol CommentRepositoryType {
    func fetchEntities(bookID: String) -> SignalProducer<[Comment], RepositoryError>
}

class CommentRepository: AbstractRepository, CommentRepositoryType {
    private static let EntitiesPath = "books"
    private static let CommentsPath = "comments"
    private static let PageKey = "page"
    private static let PageSize = 5

    func fetchEntities(bookID: String) -> SignalProducer<[Comment], RepositoryError> {

        let path = CommentRepository.EntitiesPath + "\(bookID)" + CommentRepository.CommentsPath
        let parameters = ["amount": CommentRepository.PageSize]
        return performRequest(method: .get, path: path, parameters: parameters) {
            decode($0).toResult()
        }
    }
}
