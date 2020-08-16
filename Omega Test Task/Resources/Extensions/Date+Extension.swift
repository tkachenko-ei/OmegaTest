//
//  Date+Extension.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation

extension Date {
    
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "MMMM, dd"
        return dateFormatter.string(from: self)
    }
    
}
