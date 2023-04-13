//
//  MainInteractor.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol MainInteractorProtocol: AnyObject{
    func fetchCourses()
}


protocol MainInteractorOutputProtocol: AnyObject{
    func movieDidRecieve( movies: [Film])
}

class MainInteractor{
    
    weak var presenter: MainInteractorOutputProtocol!
    
    init(presenter: MainInteractorOutputProtocol){
        self.presenter = presenter
    }
}


extension MainInteractor: MainInteractorProtocol{
    func fetchCourses() {
        MovieApi.shared.getMovie { [weak self] movie in
            self?.presenter.movieDidRecieve(movies: movie)
        }
    }
}
