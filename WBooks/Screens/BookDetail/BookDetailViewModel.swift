//
//  BookDetailViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 3/28/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import ReactiveSwift
import Networking
import Result

class BookDetailViewModel {

    fileprivate let _bookViewModel: BookViewModel

    init(bookViewModel: BookViewModel) {
        _bookViewModel = bookViewModel
    }

}
