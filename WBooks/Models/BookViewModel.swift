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
    
    func downloadImage(closure: @escaping (UIImage) -> Void) {
        guard let url = _book.image else { return }
        
        let imageFetcher = ImageFetcher()
        
        imageFetcher.fetchImage(url).startWithResult { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    closure(image)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
