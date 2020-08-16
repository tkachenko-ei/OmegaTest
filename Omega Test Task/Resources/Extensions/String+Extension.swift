//
//  String+Extension.swift
//  Omega Test Task
//
//  Created by Yevhenii Tkachenko on 14.08.2020.
//  Copyright © 2020 Yevhenii Tkachenko. All rights reserved.
//

import Foundation

extension String {
    
    var date: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.locale = .current
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self)
    }

}
