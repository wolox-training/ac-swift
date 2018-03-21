//
//  LibraryCellView.swift
//  WBooks
//
//  Created by Ariel Cid on 3/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class LibraryCellView: UITableViewCell, NibLoadable {
    
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    override internal func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setCellData(bookViewModel: BookViewModel) {
        bookTitle.text = bookViewModel.title
        bookAuthor.text = bookViewModel.author
        bookViewModel.downloadImage { self.bookCover.image = $0 }
    }
    
}

fileprivate extension LibraryCellView {
    
    func setupUI() {
        setupBook()
    }
 
    func setupBook() {
        bookTitle.font = .systemBold(size: 17)
        bookTitle.textColor = .darkGray
        
        bookAuthor.font.withSize(15)
        bookAuthor.textColor = .darkGray
    }
    
}
