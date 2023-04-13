//
//  MainConfigurator.swift
//  MovieViper
//
//  Created by Рустам Т on 4/12/23.
//

import Foundation

protocol MainConfigProtocol: AnyObject{
    func config(viewController: MainViewController)
}

class MainConfig: MainConfigProtocol{
    func config(viewController: MainViewController) {
        let presenter = MainPresenter(view: viewController)
        let interactor = MainInteractor(presenter: presenter)
        let router = MainRouter(view: viewController)
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
