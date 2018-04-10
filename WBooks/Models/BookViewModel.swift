//
//  BookViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 3/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Utils

class BookViewModel: FetchedImageViewModelType {
    fileprivate var _book: Book
    
    init(book: Book) {
        _book = book
    }

    var id: Int {
        return _book.id
    }

    var title: String {
        return _book.title
    }
    
    var author: String {
        return _book.author
    }

    var year: String {
        return _book.year
    }

    var genre: String {
        return _book.genre
    }

    var imageURL: URL? {
        return _book.image
    }
}
