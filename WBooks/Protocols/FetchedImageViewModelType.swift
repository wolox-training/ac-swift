//
//  FetchedImageViewModelType.swift
//  WBooks
//
//  Created by Ariel Cid on 4/9/18.
//  Copyright © 2018 Wolox. All rights reserved.
//

import Foundation
import Core
import UIKit
import Utils

protocol FetchedImageViewModelType {
    func getImage(imageURL: URL?, closure: @escaping (UIImage) -> Void)
}

extension FetchedImageViewModelType {
    func getImage(imageURL: URL?, closure: @escaping (UIImage) -> Void) {
        guard let url = imageURL else { return }
        let imageFetcher = ImageFetcher()

        imageFetcher.fetchImage(url).startWithResult { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    closure(image)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
