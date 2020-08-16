//
//  Money.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation

struct Money {
    
    var value: String
    var currencyCode: CurrencyCode
    
    // MARK: - Public
    
    public var valueAndCode: String {
        switch currencyCode {
        case .gbp:
            var newValue = value
            if value.first != "-" {
                newValue.insert("+", at: newValue.startIndex)
            }
            newValue.insert("£", at: newValue.index(newValue.startIndex, offsetBy: 1))
            return newValue
        case .rub:
            return value.first == "-" ? value + "₽" : "+" + value + "₽"
        case .usd:
            return value.first == "-" ? value + "$" : "+" + value + "$"
        }
    }
    
    // MARK: - Init
    
    init(dictionary: [String: String]) {
        value = dictionary["value"] ?? ""
        currencyCode = CurrencyCode(rawValue: dictionary["currencyCode"] ?? "gbp") ?? .gbp
    }
    
    // MARK: - Init
    
    enum CurrencyCode: String {
        case gbp, rub, usd
    }
}
