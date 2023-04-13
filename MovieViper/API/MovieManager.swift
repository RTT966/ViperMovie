//
//  MovieManager.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

    class MovieApi{
        let apiKey = "4d81d912-bb9d-4c4b-a32b-098dc0ac7351"
        
        static let shared = MovieApi()
        
        func getMovie(completion: @escaping ([Film])->()){
            let urlS =
            "https://kinopoiskapiunofficial.tech/api/v2.2/films/top?type=TOP_250_BEST_FILMS&page=1"
            
            guard let url = URL(string: urlS) else {return}
            let request = NSMutableURLRequest(url: url)
            request.addValue(apiKey, forHTTPHeaderField: "X-API-Key")
            request.httpMethod = "GET"
            
            let session = URLSession.shared
            session.dataTask(with: request as URLRequest) { data, response, error in
                guard let data = data else {return}
                let decoder = JSONDecoder()
                do{
                    let movies = try decoder.decode(Movies.self, from: data)
                    completion(movies.films)
                }catch{
                    print(error)
                }
            }.resume()
        }
        
    }

