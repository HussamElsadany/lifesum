//
//  GradientView.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//

import UIKit

class GradientView: UIView, CAAnimationDelegate {

    let color1: CGColor = UIColor(red: 243/255, green: 167/255, blue: 78/255, alpha: 1).cgColor
    let color2: CGColor = UIColor(red: 237/255, green: 84/255, blue: 96/255, alpha: 1).cgColor

    let gradient: CAGradientLayer = CAGradientLayer()
    var gradientColorSet: [[CGColor]] = []
    var colorIndex: Int = 0

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCircular()
        setupGradient()
        animateGradient()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        makeCircular()
        setupGradient()
        animateGradient()
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag {
            animateGradient()
        }
    }

    private func makeCircular() {
        layer.cornerRadius = self.layer.frame.width / 2
        layer.masksToBounds = true
    }

    private func setupGradient() {

        gradientColorSet = [
            [color1, color2],
            [color2, color1],
            [color1, color2],
        ]

        gradient.startPoint = CGPoint(x:0.0, y:0.0)
        gradient.endPoint = CGPoint(x:1.0, y:1.0)
        gradient.frame = bounds
        gradient.colors = gradientColorSet[colorIndex]

        layer.addSublayer(gradient)
    }

    private func animateGradient() {
        gradient.colors = gradientColorSet[colorIndex]

        let gradientAnimation = CABasicAnimation(keyPath: "colors")
        gradientAnimation.delegate = self
        gradientAnimation.duration = 2.0

        updateColorIndex()
        gradientAnimation.toValue = gradientColorSet[colorIndex]

        gradientAnimation.fillMode = .forwards
        gradientAnimation.isRemovedOnCompletion = false

        gradient.add(gradientAnimation, forKey: "colors")
    }

    private func updateColorIndex() {
        if colorIndex < gradientColorSet.count - 1 {
            colorIndex += 1
        } else {
            colorIndex = 0
        }
    }
}
