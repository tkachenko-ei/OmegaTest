//
//  ContentView.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import SwiftUI

struct TransactionsView: View {
    
    @ObservedObject var transactionsViewModel = TransactionsViewModel()
    
    var body: some View {
        NavigationView {
            List(transactionsViewModel.transactions) { transaction in
                self.containedView(transaction: transaction)
            }
            .navigationBarTitle("Transactions")
        }
    }
    
    private func containedView(transaction: Transaction) -> AnyView {
        switch transaction {
        case let .day(date, amount):
            return AnyView(DayCell(day: (date: date, amount: amount)))
        case let .transaction(_, title, amount, icon, type):
            return AnyView(TransactionCell(transaction: (title: title, amount: amount, icon: icon, type: type)))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView()
    }
}
