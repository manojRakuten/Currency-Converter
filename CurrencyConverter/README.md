
# Currecy Converter

A SwiftUI based application to convert currency.


## Authors

- [@Manoj](https://github.com/manojRakuten)


## Screenshots

![App Screenshot](https://drive.google.com/file/d/1BIBnkLD4LE0Jvr-g8Vn0b5Al77nAzQar/view?usp=share_link)
![App Screenshot](https://drive.google.com/file/d/1BIBnkLD4LE0Jvr-g8Vn0b5Al77nAzQar/view?usp=share_link)

## Features

- Live conversion if currency updated from Picker
- Reset Amount
- Custom SwiftUI Loader (Can be used separately)

#### Live conversion
If user already checked the result using one currency, If he/she wants to change the currency, then he/she doesn't has to press the convert again the conversion valuue will be populated autometically according to the new values choosen.

#### Reset
User can see the reset button once he/she successfully got the the result once. On pressing reset all the entries will be set to default.

#### Validations
The input form is properly valdated. User will not able to click on convert unless he enter some value to amount.

#### Custom Loader
User can change the loader and background color according to one's requirement.
``LoaderView(color: .black, bgColor: .yellow)``
## Demo

Insert gif or link to demo


## API Reference

#### Get all supported currency codes

```http
  GET /api/${api_key}/codes
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `api_key` | `string` | **Required**. Your API key |

#### Get converted result

```http
  GET /api/${api_key}/pair/${from}/${to}/${amount}
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `from`    | `string` | **Required**. CurrencyCode from which you want to convert|
| `to`      | `string` | **Required**. CurrencyCode to which you want to convert  |
| `amount`  | `string` | **Required**. amount which you want to convert           |

## Design Pattern

**Client:** MVVM, Clean Architecture
#### MVVM:
![App Screenshot](https://drive.google.com/file/d/1BIBnkLD4LE0Jvr-g8Vn0b5Al77nAzQar/view?usp=share_link)

- MVVM includes four major components, model, view, view model, and controller.
- The primary goal to make project easy to understand for anyone, so that any new developer can understand my structure and can work on it with ease.
- All the UI related stuffs are in **Views** folder which is created separately.
- All bussiness logic available in **ViewModel/ConverterViewModel** related to netwok call and other small tasks.
  - getAvailableCurrencies() : This method used to fetch all supported currencies and returning the codes and error to View using completion handler.
  - fetchConversionResult() : used to fetch the conversion result and store in viewModel to use later by Views.
  - checkValidations(): Used to check if the form has sufficient data to fetch result from network.
- All models used to fetch and map from API are present in **Model** Folder
  - ConvertedResponse.swift - used to map the final result of conversion.
  - AvailableCodesResponse.swift - used to map all the supported codes available to convert
  
#### Clean Architecture
#### Networking
All the major tasks like Network Calls are present in **Networking** Folder.
- Services: Containn all Service Requests used in App
   - AvailableCurrency
   - CurrencyConversion
- APIManager: This contains all the functinality responsible for a newtwork call to happen.
  - RequestHandler: Responsible for creating response with parameters (if available)
  - ResponseHandler: Responsible for decode the response model.
  - APILoader: Responsible for creting and running API request and return response or error accordingly.
  - APIPath: Contains the URL Paths used in App. 

#### SupportingFiles
Contains All Helper classes like Constant, Extensions, Localization
## Deployment

[![Xcode Version](https://img.shields.io/badge/Xcode-version%2013.2.1-green)]()
[![SwiftUI](https://img.shields.io/badge/SwiftUI-3.0-yellow)]()
[![SwiftUI](https://img.shields.io/badge/iOS-15.2-orange)]()


## Support

For support, reachout to me on  
- [Mail](mailto:manoj.rana@rakuten.com)
- [Mobile](tel:+919692717907)

