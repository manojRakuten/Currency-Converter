//
//  AvailableCurrency.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import Foundation
struct AvailableCurrency: APIHandler {
    
    func makeRequest(from param: [String: Any]) -> URLRequest? {
        let urlString =  APIPath().supportedCodes
        if var url = URL(string: urlString) {
            if param.count > 0 {
                url = setQueryParams(parameters: param, url: url)
            }
            var urlRequest = URLRequest(url: url)
            //setDefaultHeaders(request: &urlRequest)
            urlRequest.httpMethod = RequestMethod.get.rawValue
            return urlRequest
        }
        return nil
    }
    
    func parseResponse(data: Data, response: HTTPURLResponse) throws -> AvailableCodesResponse {
        return try defaultParseResponse(data: data,response: response)
    }
}
