//
//  BookViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 3/19/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation

class BookViewModel {
    fileprivate var _book: Book
    
    init(book: Book) {
        _book = book
    }
    
    var title: String {
        return _book.title
    }
    
    var author: String {
        return _book.author
    }
    
    var image: URL? {
        return _book.image
    }
    
}
