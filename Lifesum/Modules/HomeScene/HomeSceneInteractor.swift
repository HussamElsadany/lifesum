//
//  HomeSceneInteractor.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol HomeSceneBusinessLogic: AnyObject {
    func getRandomFood()
}

protocol HomeSceneDataStore: AnyObject {
    var foodResponse: FoodResponseModel? { get set }
}

class HomeSceneInteractor: HomeSceneBusinessLogic, HomeSceneDataStore {

    // MARK: Stored Properties
    let presenter: HomeScenePresentationLogic

    private let worker = HomeSceneWorkers()

    var foodResponse: FoodResponseModel?

    // MARK: Initializers
    required init(presenter: HomeScenePresentationLogic) {
        self.presenter = presenter
    }
}

extension HomeSceneInteractor {

    func getRandomFood() {

        let randomFoodInt = Int.random(in: 1..<20)

        worker.getFoodData(foodId: randomFoodInt) { [weak self] response in
            self?.foodResponse = response
            self?.presenter.present(food: response)
        } failure: { [weak self] error in
            self?.presenter.present(error: error)
        }
    }
}
