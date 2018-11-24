//
//  DateFormatter.swift
//  IOS-Movies
//
//  Created by Wbeimar Logatto on 11/23/18.
//  Copyright © 2018 Wbeimar Logatto. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
}
