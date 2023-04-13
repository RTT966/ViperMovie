//
//  DetailInteractor.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation



protocol DetailInteractorProtocol:AnyObject{
   func provideMovieDetails ()
    var isFavourite: Bool {get set}
    func setFavStatus()
}


protocol DetailInteractorOutputProtocol:AnyObject{
    func recieveMovieDetails(movie: Film)
}


class DetailInteractor{
    
    var isFavourite: Bool{
        get{
            DataManager.shared.loadFavouriteStatus(courseName: movies.nameRu)
        }set{
            DataManager.shared.saveFavouriteStatus(courseName: movies.nameRu, status: newValue)
        }
    }
    weak var presenter: DetailInteractorOutputProtocol!
    private var movies: Film
    
    init(presenter:DetailInteractorOutputProtocol, movies: Film){
        self.movies = movies
        self.presenter = presenter
    }
}


extension DetailInteractor: DetailInteractorProtocol{
    func provideMovieDetails() {
        let movieDetails = Film(nameRu: movies.nameRu, year: movies.year, rating: movies.rating, posterURL: movies.posterURL)
        presenter.recieveMovieDetails(movie: movieDetails)
          
    }
    
    func setFavStatus() {
        isFavourite.toggle()
    }
}
