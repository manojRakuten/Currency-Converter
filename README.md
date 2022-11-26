
# Currecy Converter

A SwiftUI based application to convert currency.


## Authors

- [@Manoj](https://github.com/manojRakuten)


## Features

- Live conversion if currency updated from Picker
- Reset Amount
- Custom SwiftUI Loader (Can be used separately)
- Localizations for Malay Language

#### Live conversion
If user already checked the result using one currency, If he/she wants to change the currency, then he/she doesn't has to press the convert again the conversion valuue will be populated autometically according to the new values choosen.

#### Reset
User can see the reset button once he/she successfully got the the result once. On pressing reset all the entries will be set to default.

#### Validations
The input form is properly valdated. User will not able to click on convert unless he enter some value to amount.

#### Custom Loader
User can change the loader and background color according to one's requirement.\
``CustomLoader(color: .black, background: .black, size: .small)``

#### Localization
User can run the app in local "Malay" Language by going to setting and change iPhone language to Malay


## Screenshots
<a href="url"><img src="https://user-images.githubusercontent.com/70250603/204080814-0599ce18-07d9-4c2a-b431-d2b03d9fdfd7.png" align="left" height="600" width="300" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/70250603/204080828-43dff9f1-8ec2-4867-af66-6ecd667873f8.png" align="centre" height="600" width="300" ></a>


## Demo
https://user-images.githubusercontent.com/70250603/204095513-a2ecf352-ca96-42af-923d-0782fc4be82b.mov


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
[Screenshot 2022-11-26 at 2 32 45 PM](https://user-images.githubusercontent.com/70250603/204081020-a45f95b4-4d61-4ac7-ba44-58cbd75ea637.png)

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

