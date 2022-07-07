//
//  HomeSceneRouter.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeSceneRoutingLogic: AnyObject {
    typealias Controller = HomeSceneDisplayView & HomeViewController
}

class HomeSceneRouter {

    // MARK: Stored Properties
    var viewController: Controller?

    // MARK: Initializers
    required init(controller: Controller?) {
        self.viewController = controller
    }
}

extension HomeSceneRouter: HomeSceneRoutingLogic {

}
