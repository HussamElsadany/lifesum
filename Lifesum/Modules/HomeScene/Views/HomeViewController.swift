//
//  HomeViewController.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeSceneDisplayView: AnyObject {

}

class HomeViewController: UIViewController {

    var interactor: HomeSceneBusinessLogic!
    var dataStore: HomeSceneDataStore!
    var viewStore: HomeSceneViewStore!
    var router: HomeSceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension HomeViewController: HomeSceneDisplayView {

}
