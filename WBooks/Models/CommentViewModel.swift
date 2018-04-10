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

class CommentViewModel: FetchedImageViewModelType {
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

    var imageURL: URL? {
        return user.imageURL
    }
}
