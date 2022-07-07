//
//  HomeSceneModels.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum HomeScene {
    enum Food { }
}

extension HomeScene.Food {
    struct ViewModel {
        let title: String
        let calories: String
        let carbs: String
        let protein: String
        let fat: String
    }
}
