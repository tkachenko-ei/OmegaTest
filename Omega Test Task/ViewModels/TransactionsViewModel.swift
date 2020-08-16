//
//  TransactionsFeed.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation
import Combine

class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    
    // MARK: - Init
    
    init() {
        fetchTransactions()
    }
    
    // MARK: - Methods
    
    func fetchTransactions() {
        ApiService.shared.getTransactions { [weak self] (transactions, error) in
            DispatchQueue.main.async {
                self?.transactions = transactions ?? []
            }
        }
    }
}
