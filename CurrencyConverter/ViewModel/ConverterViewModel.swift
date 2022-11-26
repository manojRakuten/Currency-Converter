//
//  ConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation

class ConverterViewModel {
    var conversionResult: ConvertedResponse?
    var availableCurrency: AvailableCodesResponse?
    
    //MARK: - API Methods
    func getAvailableCurrencies(completion: @escaping ([String], [String], ServiceError?) -> ()) {
            let request = AvailableCurrency()
            let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(params: [:]) { [weak self] (model, error) in
                guard let self = self else { return }
                if let _ = error {
                    completion([], [], error)
                } else {
                    self.availableCurrency = model
                    guard let codes = model?.supported_codes else {
                        return
                    }
                    let flattenArray = codes.flatMap {$0}
                    let currencyCodes = stride(from: 0, to: flattenArray.count - 1, by: 2).map { flattenArray[$0] }
                    let currencyNames = stride(from: 1, to: flattenArray.count, by: 2).map { flattenArray[$0] }
                    completion(currencyCodes, currencyNames, nil)
                }
            }
    }

    func fetchConversionResult(from: String, to: String, amount:String, completion: @escaping (ServiceError?) -> ()) {
            let request = CurrencyConversion(from: from, to: to, amount: amount)
            let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(params: [:]) { [weak self] (model, error) in
                guard let self = self else {return}
                if let _ = error {
                    completion(error)
                } else {
                    self.conversionResult = model
                    completion(nil)
                }
            }
    }
    
    //MARK: - Validation
    func checkFormValidation(amount: String) -> AlertType? {
        if amount.isEmpty {
            return .emptyAmount
        } else {
            return nil
        }
    }
}

enum AlertType {
    case emptyAmount, apiFailed
}
