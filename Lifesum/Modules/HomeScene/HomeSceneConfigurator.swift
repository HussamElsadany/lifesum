//
//  HomeSceneConfigurator.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

class HomeSceneConfigurator {

    static func configure() -> HomeViewController {
        let viewController = HomeViewController()
        let presenter = HomeScenePresenter(displayView: viewController)
        let interactor = HomeSceneInteractor(presenter: presenter)
        let router = HomeSceneRouter(controller: viewController)
        viewController.interactor = interactor
        viewController.dataStore = interactor
        viewController.router = router
        viewController.viewStore = presenter
        return viewController
    }
}
