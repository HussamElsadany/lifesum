//
//  FoodModels.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//

struct FoodResponseModel: Codable {
    let meta: FoodMetaModel
    let response: FoodDataResponseModel
}

struct FoodMetaModel: Codable {
    let code: Int
}

struct FoodDataResponseModel: Codable {
    let title: String
    let calories, carbs, protein, fat, saturatedfat, unsaturatedfat: Double
    let fiber: Double
    let cholesterol: Double
    let sugar: Double
    let sodium, potassium: Double
    let gramsperserving: Double
    let pcstext: String
}
