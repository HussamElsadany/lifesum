//
//  UIButton+Extension.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//

import UIKit

extension UIButton {
    var activityIndicatorTag: Int {
        return 1
    }

    func startLoading(style: UIActivityIndicatorView.Style = .medium) {
        setTitle("", for: .disabled)
        isEnabled = false
        let activityIndicator = UIActivityIndicatorView(style: style)
        activityIndicator.color = self.titleLabel?.textColor
        activityIndicator.tag = activityIndicatorTag
        addSubview(activityIndicator)
        pinItemToEdges(item: activityIndicator)
        activityIndicator.startAnimating()
        UIView.performWithoutAnimation { [weak self] in
            self?.layoutIfNeeded()
        }
    }

    func stopLoading() {
        isEnabled = true
        if let activityIndicator = viewWithTag(activityIndicatorTag) as? UIActivityIndicatorView {
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
        }

        UIView.performWithoutAnimation { [weak self] in
            self?.layoutIfNeeded()
        }
    }
}
