//
//  ApiService.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation
import Apollo

class ApiService {
    
    // MARK: - Singleton
    
    static let shared = ApiService()
    private init() {}
    
    // MARK: - Apollo

    private lazy var networkTransport: HTTPNetworkTransport = {
        return HTTPNetworkTransport(url: URL(string: "http://localhost:4000")!)
    }()
    private(set) lazy var apollo = ApolloClient(networkTransport: self.networkTransport)
    
    // MARK: - Methods
    
    func getTransactions(completion: @escaping ([Transaction]?, Error?) -> ()) {
        apollo.fetch(query: ListWidgetsQuery(), queue: .global(qos: .background)) { result in
            switch result {
            case .success(let graphQLResult):
                if let list = graphQLResult.data?.jsonObject["dailyTransactionsFeed"] as? [[String: Any]] {
                    let transactions = list.map { Transaction(dictionary: $0) }.filter { $0 != nil }.map { $0! }
                    completion(transactions, nil)
                } else if let errors = graphQLResult.errors {
                    completion(nil, errors.first)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
