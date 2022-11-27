//
//  SupportedCodes.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation
struct SupportedCodes : Codable {
    let documentation : String?
    let terms_of_use : String?
    let supported_codes : [[String]]?

    var currencyCodes: [String] {
        return supported_codes?.map({$0.first ?? .empty}) ?? []
    }
    var currencyNames: [String] {
        return supported_codes?.map({$0.last ?? .empty}) ?? []
    }

    enum CodingKeys: String, CodingKey {
        case documentation, terms_of_use, supported_codes
    }
}
