//
//  HomeSceneWorkers.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol HomeSceneWorkerLogic {
    func getFoodData(foodId: Int, success: @escaping(FoodResponseModel) -> Void, failure: @escaping(Error) -> Void)
}

class HomeSceneWorkers: HomeSceneWorkerLogic {

    func getFoodData(foodId: Int,
                     success: @escaping(FoodResponseModel) -> Void,
                     failure: @escaping(Error) -> Void) {

        // this is not the right place to handle urls, but i make it for quick use with the network.

        let urlString = "https://api.lifesum.com/v2/foodipedia/codetest?foodid=\(foodId)"
        guard let url = URL(string: urlString) else {
            return
        }

        NetworkClient.shared.get(url) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(FoodResponseModel.self, from: data)
                    success(response)
                } catch {
                    failure(error)
                }
            case .failure(let error):
                failure(error)
            }
        }
    }
}
