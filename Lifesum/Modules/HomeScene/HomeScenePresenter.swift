//
//  HomeScenePresenter.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeScenePresentationLogic: AnyObject {

}

protocol HomeSceneViewStore: AnyObject {

}

class HomeScenePresenter: HomeScenePresentationLogic, HomeSceneViewStore {

    // MARK: Stored Properties
    weak var displayView: HomeSceneDisplayView?

    // MARK: Initializers
    required init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
}

extension HomeScenePresenter {

}
