//
//  MainPresenter.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation


protocol MainPresenterProtocol: AnyObject{
    func viewDidLoad()
    var movies: [Film] {get}
    var moviesCount: Int? {get}
    func movie (indexPath: IndexPath)-> Film?
    func showMovieDetails(indexPath: IndexPath)
}

class MainPresenter{
    
    var movies: [Film] = []
    var moviesCount: Int? {
        movies.count
    }
    weak var view: MainViewProtocol!
    var interactor: MainInteractorProtocol!
    var router: MainRouterProtocol!

    required init(view: MainViewProtocol){
        self.view = view
    }
    
}


extension MainPresenter: MainInteractorOutputProtocol{
    func movieDidRecieve(movies: [Film]) {
        self.movies = movies
        view.reloadData()
    }
    
    
}


extension MainPresenter: MainPresenterProtocol{
    func viewDidLoad() {
        interactor.fetchMovies()
    }
    
    func movie(indexPath: IndexPath) -> Film? {
        if movies.indices.contains(indexPath.row){
            return movies[indexPath.row]
        }else{
            return nil
        }
    }
    
    func showMovieDetails(indexPath: IndexPath) {
        if movies.indices.contains(indexPath.row){
            let movie = movies[indexPath.row]
            router.openDetailVC(movie: movie)
        }
    }
}
