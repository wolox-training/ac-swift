//
//  BookDetailView.swift
//  WBooks
//
//  Created by Ariel Cid on 3/26/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class BookDetailView: UIView, NibLoadable {
    
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAvailability: UILabel!
    @IBOutlet weak var bookInfo: UILabel!
    @IBOutlet weak var wishlistButton: UIButton!
    @IBOutlet weak var rentButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func loadBook(bookViewModel: BookViewModel) {
        /*
        bookTitle.text = bookViewModel.title
        bookInfo.text = bookViewModel.author
        bookViewModel.downloadImage { self.bookImage.image = $0 }
        */
    }
}

fileprivate extension BookDetailView {
    
    func setupUI() {
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
        wishlistButton.titleLabel?.text = "ADD TO WISHLIST"
        
        //  TO DO: RENTAL AVAILABILITY
        rentButton.layer.cornerRadius = 25
        rentButton.setGradient()
        rentButton.titleLabel?.text = "RENT"
    }
}
