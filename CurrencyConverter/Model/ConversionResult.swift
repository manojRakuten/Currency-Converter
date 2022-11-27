//
//  ConversionResult.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation

struct ConversionResult : Codable {
    let time_last_update_utc : String?
    let conversion_rate : Double?
    let conversion_result : Double?

    enum CodingKeys: String, CodingKey {
        case time_last_update_utc, conversion_rate, conversion_result
    }
}
