//
//  HomeViewController.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol HomeSceneDisplayView: AnyObject {
    func displayFood(viewModel: HomeScene.Food.ViewModel)
    func displayError(message: String)
}

class HomeViewController: UIViewController {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var caloriesAmountLabel: UILabel!
    @IBOutlet private weak var caloriesPerServingLabel: UILabel!
    @IBOutlet private weak var carbsValueLabel: UILabel!
    @IBOutlet private weak var proteinValueLabel: UILabel!
    @IBOutlet private weak var fatValueLabel: UILabel!
    @IBOutlet private weak var moreInfoButton: UIButton!
    @IBOutlet private weak var infoStackView: UIStackView!
    @IBOutlet private weak var gradientView: GradientView!

    var interactor: HomeSceneBusinessLogic!
    var dataStore: HomeSceneDataStore!
    var viewStore: HomeSceneViewStore!
    var router: HomeSceneRoutingLogic!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func moreInfoAction(_ sender: Any) {
        moreInfoButton.startLoading()
        interactor.getRandomFood()
    }
}

extension HomeViewController: HomeSceneDisplayView {

    func displayFood(viewModel: HomeScene.Food.ViewModel) {
        DispatchQueue.main.async {
            self.moreInfoButton.stopLoading()
            self.updateViewData()
        }
    }

    func displayError(message: String) {
        DispatchQueue.main.async {
            self.moreInfoButton.stopLoading()
            let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction.init(title: "Ok", style: .cancel))
            self.present(alertController, animated: true)
        }
    }
}

private extension HomeViewController {

    func updateViewData() {
        guard let foodViewModel = viewStore.foodViewModel else {
            return
        }
        titleLabel.text = foodViewModel.title
        animateLabelTextChangeFromLeft(label: caloriesAmountLabel, text: foodViewModel.calories)
        animateLabelTextChangeFromTop(label: carbsValueLabel, text: foodViewModel.carbs)
        animateLabelTextChangeFromTop(label: proteinValueLabel, text: foodViewModel.protein)
        animateLabelTextChangeFromTop(label: fatValueLabel, text: foodViewModel.fat)
    }

    func animateLabelTextChangeFromLeft(label: UILabel, text: String) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromLeft
        label.text = text
        animation.duration = 0.25
        label.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }

    func animateLabelTextChangeFromTop(label: UILabel, text: String) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.push
        animation.subtype = CATransitionSubtype.fromTop
        label.text = text
        animation.duration = 0.25
        label.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
}
