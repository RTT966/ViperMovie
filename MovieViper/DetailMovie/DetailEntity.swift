//
//  DetailEntity.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation


struct Movies: Decodable {
    let pagesCount: Int
    let films: [Film]
}

// MARK: - Film
struct Film: Codable {
    
    let nameRu: String
    
    let year: String
    let rating: String
    let posterURL:String

    

    enum CodingKeys: String, CodingKey {
        
        case nameRu, year, rating
        case posterURL = "posterUrl"
    }
}
