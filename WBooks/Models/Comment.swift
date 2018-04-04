//
//  Comment.swift
//  WBooks
//
//  Created by Ariel Cid on 4/3/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

struct Comment {
    var id: String
    var user: String
    var book: Book
    var content: String

    init(id: String, user: String, book: Book, content: String) {
        self.id = id
        self.user = user
        self.book = book
        self.content = content
    }
}

extension Comment: Argo.Decodable {

    static func decode(_ json: JSON) -> Decoded<Comment> {
        return curry(Comment.init)
            <^> json <| "id"
            <*> json <| "user"
            <*> json <| "book"
            <*> json <| "comment"
    }
}
