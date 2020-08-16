//
//  Transaction.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation

enum Transaction {
    
    case day(date: Date, amount: Money)
    case transaction(id: String, title: String, amount: Money, icon: String, type: TransactionType)
    
    // MARK: - Init
    
    init?(dictionary: [String: Any]) {
        guard let type = dictionary["__typename"] as? String else {
            return nil
        }
        switch type {
        case "DaySectionWidget":
            guard let date = (dictionary["date"] as? String)?.date,
                let amount = dictionary["amount"] as? [String: String] else {
                return nil
            }
            self = .day(date: date, amount: Money(dictionary: amount))
        case "TransactionWidget":
            guard let transactionInfo = dictionary["transaction"] as? [String: Any],
                let id = transactionInfo["id"] as? String,
                let title = transactionInfo["title"] as? String,
                let typeString = transactionInfo["type"] as? String,
                let type = TransactionType(rawValue: typeString.lowercased()),
                let amount = transactionInfo["amount"] as? [String: String],
                let image = dictionary["image"] as? [String: Any],
                let icon = image["iconName"] as? String else {
                return nil
            }
            self = .transaction(id: id, title: title, amount: Money(dictionary: amount), icon: icon, type: type)
        default:
            return nil
        }
    }
    
    // MARK: - Enums
    
    enum TransactionType: String {
        case regular, cashback
    }
}

// MARK: - Identifiable

extension Transaction: Identifiable {
    
    var id: String {
        switch self {
        case .day(let date, _):
            return date.date
        case .transaction(let id, _, _, _, _):
            return id
        }
    }
}
