//
//  AvailableCurrency.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation
struct AvailableCodesResponse : Codable {
    let result : String?
    let documentation : String?
    let terms_of_use : String?
    let supported_codes : [[String]]?

    enum CodingKeys: String, CodingKey {

        case result = "result"
        case documentation = "documentation"
        case terms_of_use = "terms_of_use"
        case supported_codes = "supported_codes"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        result = try values.decodeIfPresent(String.self, forKey: .result)
        documentation = try values.decodeIfPresent(String.self, forKey: .documentation)
        terms_of_use = try values.decodeIfPresent(String.self, forKey: .terms_of_use)
        supported_codes = try values.decodeIfPresent([[String]].self, forKey: .supported_codes)
    }
}
