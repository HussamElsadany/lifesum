//
//  Double+Extension.swift
//  Lifesum
//
//  Created by Hussam Elsadany on 07/07/2022.
//

import Foundation

extension Double {
    func formatDouble(_ fractionDigit: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        formatter.maximumFractionDigits = fractionDigit
        let local = Locale(identifier: "es_ES")
        formatter.locale = local
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
