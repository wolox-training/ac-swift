//
//  BookCommentCell.swift
//  WBooks
//
//  Created by Ariel Cid on 4/4/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class BookCommentCellView: UITableViewCell, NibLoadable {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userComment: UILabel!

    override internal func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }
}

fileprivate extension BookCommentCellView {

    func setupUI() {
        userName.font = .systemBold(size: 17)
        userName.textColor = .darkGray

        userComment.font = UIFont.systemFont(ofSize: 15)
        userComment.textColor = .darkGray
        userComment.numberOfLines = 0
        userComment.sizeToFit()
    }
}
