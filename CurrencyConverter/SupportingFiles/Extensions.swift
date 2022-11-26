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

extension Color {
    static let textFieldBackground = Color("textFieldBackground")
    static let errorBackground = Color("error")
}

extension Date {
    static func getFormattedDate(string: String) -> String{
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "E, d MMM yyyy HH:mm:ss Z"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "E, d MMM yyyy"
        
        let date: Date? = dateFormatterGet.date(from: string)
        print("Date",dateFormatterPrint.string(from: date!))
        return dateFormatterPrint.string(from: date!);
    }
}
