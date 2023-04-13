//
//  ImageManager.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation


class ImageManager {
    
    static let shared = ImageManager()
    
    func getImageData(from imageURL: String?) -> Data? {
        guard let stringURL = imageURL else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
        return imageData
    }
}
