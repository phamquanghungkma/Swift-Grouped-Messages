//
//  Extensions.swift
//  SwiftGroupMessage
//
//  Created by Apple on 7/16/20.
//  Copyright © 2020 Tofu. All rights reserved.
//

import Foundation
extension Date {
    static func dateFromCustomString(customString: String) -> Date {
    
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.date(from: customString) ?? Date()
    }

}
