//
//  CommentViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 4/3/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Utils

class CommentViewModel {
    fileprivate var _comment: Comment

    init(comment: Comment) {
        _comment = comment
    }

    var user: User {
        return _comment.user
    }

    var id: Int {
        return _comment.id
    }

    var book: Book {
        return _comment.book
    }

    var content: String {
        return _comment.content
    }

    private var _image: UIImage?

    func getImage(closure: @escaping (UIImage) -> Void) {
        guard let url = user.imageURL else { return }

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
