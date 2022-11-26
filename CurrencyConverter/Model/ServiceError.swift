//
//  ServiceError.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 26/11/22.
//

import Foundation

struct ServiceError: Error,Codable {
    let httpStatus: Int
    let message: String
}
