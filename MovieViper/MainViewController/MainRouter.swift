//
//  MainRouter.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol MainRouterProtocol: AnyObject{
    func openDetailVC(movie: Film)
}

class MainRouter{
    weak var view: MainViewController?
    
    init(view: MainViewController){
        self.view = view
    }
    
    
}


extension MainRouter: MainRouterProtocol{
    func openDetailVC(movie: Film) {
        view?.performSegue(withIdentifier: "det", sender: movie)
    }
}
