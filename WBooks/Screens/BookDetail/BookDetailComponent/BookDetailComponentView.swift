//
//  BookDetailComponentView.swift
//  WBooks
//
//  Created by Ariel Cid on 3/27/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class BookDetailComponentView: UIView, NibLoadable {

    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAvailability: UILabel!
    @IBOutlet weak var bookInfo: UILabel!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!

    override internal func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    func setGradients() {
        rentButton.setGradient()
    }

    func setBookData(bookViewModel: BookViewModel) {
        bookTitle.text = bookViewModel.title
        bookInfo.text = "\(bookViewModel.author)\n\(bookViewModel.year)\n\(bookViewModel.genre)"
        bookViewModel.downloadImage { self.bookImage.image = $0 }
        bookAvailability.text = "Chimpokomon"
    }

}

fileprivate extension BookDetailComponentView {

    func setupUI() {
        backgroundColor = .white

        bookTitle.font = .systemBold(size: 24)
        bookTitle.textColor = .darkGray

        //  TO DO: AVAILABILITY-BASED FORMATTING
        bookAvailability.font = .systemBold(size: 15)
        bookAvailability.textColor = .atlantis()

        bookInfo.font.withSize(15)
        bookInfo.textColor = .darkGray

        wishlistButton.layer.cornerRadius = 25
        wishlistButton.layer.borderWidth = 1
        wishlistButton.layer.borderColor = UIColor.cerulean().cgColor
        wishlistButton.backgroundColor = UIColor.white
        wishlistButton.setTitle("book-detail.wishlist-button.title".localized(), for: UIControlState.normal)
        wishlistButton.setTitleColor(.deepSkyBlue(), for: UIControlState.normal)
        wishlistButton.titleLabel?.font = .systemHeavy(size: 15)

        //  TO DO: RENTAL AVAILABILITY
        rentButton.layer.cornerRadius = 25
        rentButton.setTitle("book-detail.rent-button.title".localized(), for: UIControlState.normal)
        rentButton.setTitleColor(.white, for: UIControlState.normal)
        rentButton.titleLabel?.font = .systemHeavy(size: 15)
    }
}
