//
//  TransactionCell.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import SwiftUI

struct TransactionCell: View {
    
    var transaction: (title: String, amount: Money, icon: String, type: Transaction.TransactionType)!
    
    var body: some View {
        HStack {
            Image(transaction.type == .cashback ? "cashback" : transaction.icon)
                .padding(16)
                .background(transaction.type == .cashback ? Color.greenLight : Color.blueLight)
                .cornerRadius(28)
                .padding(.trailing, 16)
            Text(transaction.title)
                .foregroundColor(transaction.type == .cashback ? .greenDark : .primary)
            Spacer()
            Text(transaction.amount.valueAndCode)
                .foregroundColor(transaction.type == .cashback ? .greenDark : .primary)
        }.padding(16)
            .background(transaction.type == .cashback ? Color.greenLight : .clear)
            .cornerRadius(16)
    }
}

struct TransactionCell_Previews: PreviewProvider {
    static var previews: some View {
        TransactionCell()
    }
}
