//
//  MainRouter.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol MainRouterProtocol: AnyObject{
    
}

class MainRouter{
    weak var view: MainViewController?
    
    init(view: MainViewController){
        self.view = view
    }
    
    
}


extension MainRouter: MainRouterProtocol{
    
}
