//
//  CellView.swift
//  WBooks
//
//  Created by Ariel Cid on 3/15/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import UIKit
import Core

class LibraryCellView: UITableViewCell {
    
    @IBOutlet weak var bookCover: UIImageView!
    @IBOutlet weak var bookTitle: UILabel!
    @IBOutlet weak var bookAuthor: UILabel!
    
    var imageFetchingTask: URLSessionDataTask? = .none
    
    override internal func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }
    
    func setCellData(bookVM: BookViewModel) {
        bookTitle.text = bookVM.title
        bookAuthor.text = bookVM.author
        configureImage(urlBook: bookVM.image)
    }
    
    override func prepareForReuse() {
        imageFetchingTask?.cancel()
        imageFetchingTask = .none
    }
    
    func configureImage(urlBook: URL?) {
        guard let url = urlBook else { return }
        imageFetchingTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print("Failed fetching image \(error.debugDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }
            
            DispatchQueue.main.async {
                self.bookCover.image = UIImage(data: data!)
            }
        }
        imageFetchingTask?.resume()
    }
    
}

fileprivate extension LibraryCellView {
    
    func setupUI() {
        setupBook()
    }
 
    func setupBook() {
        bookTitle.font = .systemBold(size: 17)
        bookTitle.textColor = .fontDarkGray()
        
        bookAuthor.font.withSize(15)
        bookAuthor.textColor = .fontDarkGray()
    }
    
}
