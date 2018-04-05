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

    private var _image: UIImage?

    func getImage(closure: @escaping (UIImage) -> Void) {
        guard let url = _book.image else { return }

        if _image != .none {
            closure(self._image!)
        } else {
            let imageFetcher = ImageFetcher()

            imageFetcher.fetchImage(url).startWithResult { result in
                switch result {
                case .success(let image):
                    self._image = image
                    DispatchQueue.main.async {
                        closure(image)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
