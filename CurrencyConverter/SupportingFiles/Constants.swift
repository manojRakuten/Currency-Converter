//
//  Constants.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 24/11/22.
//

import Foundation
import SwiftUI
final class Constant {
    static let bundle = Bundle(for: Constant.self)

    enum Strings {
        static let pageTitle = NSLocalizedString("page_title", bundle: bundle, value: "Currency Converter", comment: "")
        static let pageDesc = NSLocalizedString("page_desc", bundle: bundle, value: "Check the value in other currencies with ease", comment: "")
        static let fromPickerHeader = NSLocalizedString("from_title", bundle: bundle, value: "From", comment: "")
        static let toPickerHeader = NSLocalizedString("to_title", bundle: bundle, value: "To", comment: "")
        static let amountPlaceholder = NSLocalizedString("amount_placeholder", bundle: bundle, value: "Enter an amount", comment: "")
        static let resetButtonTitle = NSLocalizedString("reset_button_title", bundle: bundle, value: "Reset", comment: "")
        static let convertButtonTitle = NSLocalizedString("convert_button_title", bundle: bundle, value: "Convert", comment: "")
        static let convertResultTitle = NSLocalizedString("convert_result_title", bundle: bundle, value: "Conversion Result -", comment: "")
        static let done = NSLocalizedString("done", bundle: bundle, value: "Done", comment: "")
        static let conversionRate = NSLocalizedString("conversion_rate", bundle: bundle, value: "Conversion Rate: ", comment: "")
        static let lastUpdateTime = NSLocalizedString("last_update_time", bundle: bundle, value: "Last Updated On: ", comment: "")
        static let detailsHeader = NSLocalizedString("details", bundle: bundle, value: "Details", comment: "")
        static let termsOfUse = NSLocalizedString("terms", bundle: bundle, value: "Terms of use", comment: "")
        static let documentation = NSLocalizedString("documentation", bundle: bundle, value: "Documentation", comment: "")
        static let readMe = NSLocalizedString("readMe", bundle: bundle, value: "Read Me", comment: "")
    }
    
    enum AlertValues {
        static let title = NSLocalizedString("alert_title", bundle: bundle, value: "Error", comment: "")
        static let okButton = NSLocalizedString("alert_ok", bundle: bundle, value: "OK", comment: "")
        static let amountEmpty = NSLocalizedString("alert_amountEmpty", bundle: bundle, value: "Please Enter an amount. Amount can't be Empty", comment: "")
        static let apiError = NSLocalizedString("alert_api", bundle: bundle, value: "Something went wrong", comment: "")
    }

    enum APIKeys {
        static let apiKey = "6dfe4658a7c84eeddad71aab"
    }
    
    enum Images {
        static let splashLogo = Image("splashLogo", bundle: bundle)
    }
}
