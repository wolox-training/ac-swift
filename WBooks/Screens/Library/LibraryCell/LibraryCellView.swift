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
    @IBOutlet weak var cellSpaceView: UIView!
    
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
        backgroundColor = .clear
        cellSpaceView.backgroundColor = .white
        
        layer.cornerRadius = 5
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 1
        
        setupBook()
    }
 
    func setupBook() {
        bookTitle.font = .systemBold(size: 17)
        bookTitle.textColor = .darkGray
        bookAuthor.font.withSize(15)
        bookAuthor.textColor = .darkGray
    }
    
}
