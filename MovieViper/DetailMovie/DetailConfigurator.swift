//
//  DetailConfigurator.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol DetailConfigProtocol:AnyObject{
    func configure(view: DetailViewController, movies: Film)
}

class DetailConfig:DetailConfigProtocol{
    func configure(view: DetailViewController, movies: Film) {
        let presenter = DetailPresenter(view: view)
        let interactor = DetailInteractor(presenter: presenter, movies: movies)
        
        view.presenter = presenter
        presenter.interactor = interactor
        
    }
}
