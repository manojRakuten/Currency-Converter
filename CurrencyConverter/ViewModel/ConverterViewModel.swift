//
//  ConverterViewModel.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation



class ConverterViewModel {
    var conversionResult: ConversionResult?
    var availableCurrency: SupportedCodes?
    
    //MARK: - API Methods
    func getAvailableCurrencies(completion: @escaping (SupportedCodes?, ServiceError?) -> ()) {
            let request = SupportedCurrency()
            let apiLoader = APILoader(apiHandler: request)
        apiLoader.loadAPIRequest(params: [:]) { [weak self] (model, error) in
                guard let self = self else { return }
                if let _ = error {
                    completion(nil, error)
                } else {
                    self.availableCurrency = model
                    completion(model, nil)
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
        //More Validations can be added later
    }
}

enum AlertType {
    case emptyAmount, apiFailed
}
