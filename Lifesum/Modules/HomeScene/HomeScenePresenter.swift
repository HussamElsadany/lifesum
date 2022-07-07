//
//  HomeScenePresenter.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeScenePresentationLogic: AnyObject {
    func present(food: FoodResponseModel)
    func present(error: Error)
}

protocol HomeSceneViewStore: AnyObject {
    var foodViewModel:  HomeScene.Food.ViewModel? { get set }
}

class HomeScenePresenter: HomeScenePresentationLogic, HomeSceneViewStore {

    // MARK: Stored Properties
    weak var displayView: HomeSceneDisplayView?

    var foodViewModel:  HomeScene.Food.ViewModel?

    // MARK: Initializers
    required init(displayView: HomeSceneDisplayView) {
        self.displayView = displayView
    }
}

extension HomeScenePresenter {

    func present(food: FoodResponseModel) {
        let viewModel = HomeScene.Food.ViewModel(title: food.response.title,
                                                 calories: food.response.calories.formatDouble(0),
                                                 carbs: getNumber(food.response.carbs),
                                                 protein: getNumber(food.response.protein),
                                                 fat: getNumber(food.response.fat))
        foodViewModel = viewModel
        displayView?.displayFood(viewModel: viewModel)
    }
    
    func present(error: Error) {
        displayView?.displayError(message: error.localizedDescription)
    }
}

private extension HomeScenePresenter {
    func getNumber(_ value: Double) -> String {
        let stringNumber = value.formatDouble(2)
        return stringNumber + "%"
    }
}
