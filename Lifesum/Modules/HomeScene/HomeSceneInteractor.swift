//
//  HomeSceneInteractor.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeSceneBusinessLogic: AnyObject {

}

protocol HomeSceneDataStore: AnyObject {

}

class HomeSceneInteractor: HomeSceneBusinessLogic, HomeSceneDataStore {

    // MARK: Stored Properties
    let presenter: HomeScenePresentationLogic

    // MARK: Initializers
    required init(presenter: HomeScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension HomeSceneInteractor {

}
