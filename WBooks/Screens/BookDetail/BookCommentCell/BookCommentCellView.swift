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
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 1

        userImage.layer.cornerRadius = userImage.frame.size.height / 2
        userImage.layer.masksToBounds = true
        userImage.layer.borderWidth = 0
        
        userName.font = .systemBold(size: 17)
        userName.textColor = .darkGray

        userComment.font = UIFont.systemFont(ofSize: 15)
        userComment.textColor = .darkGray
        userComment.numberOfLines = 0
        userComment.sizeToFit()
    }
}
