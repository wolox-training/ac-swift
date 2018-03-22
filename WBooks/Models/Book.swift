//
//  Book.swift
//  WBooks
//
//  Created by Ariel Cid on 3/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Argo
import Curry
import Runes

struct Book {
    var title: String
    var author: String
    var image: URL?
    
    init(title: String, author: String, imageURL: String?) {
        self.title = title
        self.author = author
        self.image = imageURL.map { URL(string: $0)! }
    }
}

extension Book: Argo.Decodable {

    static func decode(_ json: JSON) -> Decoded<Book> {
        return curry(Book.init)
            <^> json <| "title"
            <*> json <| "author"
            <*> json <|? "image_url"
    }

}
