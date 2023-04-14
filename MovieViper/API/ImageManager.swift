//
//  ImageManager.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation


class ImageManager {
    
    static let shared = ImageManager()
    
//    func getImageData(from imageURL: String?) -> Data? {
//        guard let stringURL = imageURL else { return nil }
//        guard let imageURL = URL(string: stringURL) else { return nil }
//        guard let imageData = try? Data(contentsOf: imageURL) else { return nil }
//        return imageData
//    }
    
    func getImageData(from imageURL: String?, completion: @escaping (Data?) -> Void) {
        guard let stringURL = imageURL else { completion(nil); return }
        guard let imageURL = URL(string: stringURL) else { completion(nil); return }

        let session = URLSession.shared
        let task = session.dataTask(with: imageURL) { (data, response, error) in
            if error != nil {
                print("Error downloading image: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            guard let imageData = data else {
                completion(nil)
                return
            }
            completion(imageData)
        }
        task.resume()
    }
    
    
    
    
}




    
    
    

