//
//  UserViewModel.swift
//  WBooks
//
//  Created by Ariel Cid on 4/3/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Utils

class UserViewModel {
    fileprivate var _user: User

    init(user: User) {
        _user = user
    }

    var id: String {
        return _user.id
    }

    var firstName: String {
        return _user.firstName
    }

    var lastName: String {
        return _user.lastName
    }

    private var _image: UIImage?

    func getImage(closure: @escaping (UIImage) -> Void) {
        guard let url = _user.imageURL else { return }

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
