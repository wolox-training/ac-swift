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

    var id: Int {
        return _user.id
    }

    var firstName: String {
        return _user.firstName
    }

    var lastName: String {
        return _user.lastName
    }
}
