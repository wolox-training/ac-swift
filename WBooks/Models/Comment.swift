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
    var id: Int
    var user: User
    var book: Book
    var content: String
}

extension Comment: Argo.Decodable {

    static func decode(_ json: JSON) -> Decoded<Comment> {
        return curry(Comment.init)
            <^> json <| "id"
            <*> json <| "user"
            <*> json <| "book"
            <*> json <| "content"
    }
}
