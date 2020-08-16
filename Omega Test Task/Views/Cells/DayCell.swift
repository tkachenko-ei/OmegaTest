//
//  DayCell.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import SwiftUI

struct DayCell: View {
    
    var day: (date: Date, amount: Money)!
    
    var body: some View {
        HStack {
            Text(day.date.day)
                .foregroundColor(.gray)
            Spacer()
            Text(day.amount.valueAndCode)
                .bold()
        }.padding(16)
    }
}

struct DayCell_Previews: PreviewProvider {
    static var previews: some View {
        DayCell()
    }
}
