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
    @IBOutlet weak var bookAuthor: UILabel!
    @IBOutlet weak var bookYear: UILabel!
    @IBOutlet weak var bookGenre: UILabel!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var viewSeparator: UIView!
    @IBOutlet weak var containerView: UIView!

    private var rentGradient: CAGradientLayer?
    
    override internal func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        rentButton.setGradient()
    }

    func setGradients() {

    }
}

fileprivate extension BookDetailComponentView {

    // swiftlint:disable:next function_body_length
    func setupUI() {
        backgroundColor = .white
        viewSeparator.backgroundColor = UIColor.polar()

        containerView.layer.cornerRadius = 5
        containerView.layer.backgroundColor = UIColor.clear.cgColor
        containerView.layer.shadowOffset = CGSize(width: 0, height: 1)
        containerView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        containerView.layer.shadowOpacity = 1
        containerView.layer.shadowRadius = 1

        bookTitle.font = .systemBold(size: 24)
        bookTitle.textColor = .darkGray

        //  TODO: AVAILABILITY-BASED FORMATTING
        bookAvailability.font = .systemBold(size: 15)
        bookAvailability.textColor = .atlantis()
        bookAvailability.text = "Available"

        bookAuthor.font.withSize(15)
        bookAuthor.textColor = .darkGray
        bookYear.font.withSize(15)
        bookYear.textColor = .darkGray
        bookGenre.font.withSize(15)
        bookGenre.textColor = .darkGray

        wishlistButton.layer.cornerRadius = rentButton.frame.height / 2
        wishlistButton.layer.borderWidth = 1
        wishlistButton.layer.borderColor = UIColor.cerulean().cgColor
        wishlistButton.backgroundColor = UIColor.white
        wishlistButton.setTitle("book-detail.wishlist-button.title".localized(), for: UIControlState.normal)
        wishlistButton.setTitleColor(.deepSkyBlue(), for: UIControlState.normal)
        wishlistButton.titleLabel?.font = .systemHeavy(size: 15)

        //  TODO: RENTAL AVAILABILITY
        rentButton.layer.cornerRadius = rentButton.frame.height / 2
        rentButton.setTitle("book-detail.rent-button.title".localized(), for: UIControlState.normal)
        rentButton.setTitleColor(.white, for: UIControlState.normal)
        rentButton.titleLabel?.font = .systemHeavy(size: 15)
    }
}
