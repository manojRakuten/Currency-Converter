//
//  APIPath.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation

let baseURL = "https://v6.exchangerate-api.com/v6/\(Constant.APIKeys.apiKey)/"

struct APIPath {
    var supportedCodes: String { return "\(baseURL)codes"}
    var convertCurrency: String { return "\(baseURL)pair"}
}
