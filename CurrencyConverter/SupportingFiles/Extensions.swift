//
//  Extensions.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 24/11/22.
//

import Foundation
import SwiftUI

extension String {
    static let empty = ""
}

extension Date {
    static func getFormattedDate(string: String) -> String {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.locale = Locale(identifier: "en_US_POSIX")
        dateFormatterGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        var date: Date!
        
        if string.isEmpty {
            date = Date()
        } else if let _date = dateFormatterGet.date(from: string) {
            date = _date
        } else {
            return string
        }
        dateFormatterGet.dateFormat = "MMM d, yyyy"
        return dateFormatterGet.string(from: date)
    }
}
