//
//  DetailPresenter.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol DetailPresenterProtocol: AnyObject{
   func showDetail()
    var isFavourite: Bool {get}
    func favouriteButPressed()
}






class DetailPresenter{
    
    weak var view: DetailVCProtocol!
    var interactor: DetailInteractorProtocol!
    var isFavourite: Bool{
        interactor.isFavourite
    }
    
    init(view: DetailVCProtocol){
        self.view = view
    }
    
    
}





extension DetailPresenter: DetailPresenterProtocol{
    func showDetail() {
        interactor.provideMovieDetails()
    }
    func favouriteButPressed() {
        interactor.setFavStatus()
        view.setImageForFavoriteButton()
    }
    
}

extension DetailPresenter: DetailInteractorOutputProtocol{
    func recieveMovieDetails(movie: Film) {
        view.setMovieName(tittle: movie.nameRu)
        view.setMovieYear(tittle: movie.year)
        view.setMovieRating(tittle: movie.rating)
        view.setImageForFavoriteButton()
        guard let imageData = ImageManager.shared.getImageData(from: movie.posterURL) else {return}
        view.setMovieImage(data: imageData)
    }
    
    
}
