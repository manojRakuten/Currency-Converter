//
//  ConversionView.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 24/11/22.
//

import SwiftUI
struct ConversionView: View {
    
    @State private var fromCurrencySelected: Int = 0
    @State private var toCurrencySelected: Int = 1
    @State private var amount: String = .empty
    @State private var currencyNames:[String] = []
    @State private var currencyCodes: [String] = []
    @State private var isConversionSuccessful: Bool = false
    @State private var resultAmount: String = .empty
    @State private var lastUpdatedTime: String = .empty
    @State private var isLoading: Bool = false
    @State private var showAlert: Bool = false
    @State private var alertType: AlertType = .apiFailed
    var viewModel: ConverterViewModel = ConverterViewModel()
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .top) {
                VStack {
                    Form {
                        Section {
                            Picker(!(currencyNames.isEmpty) ? currencyNames[fromCurrencySelected] : .empty , selection: $fromCurrencySelected) {
                                ForEach(0 ..< currencyCodes.count, id: \.self) { index in
                                    Text(self.currencyCodes[index]).tag(index)
                                }
                            }.onChange(of: fromCurrencySelected) { newValue in
                                if isConversionSuccessful {
                                    if let validationError = viewModel.checkFormValidation(amount: amount) {
                                        alertType = validationError
                                        showAlert = true
                                    } else {
                                        isLoading = true
                                        viewModel.fetchConversionResult(from: currencyCodes[newValue], to: currencyCodes[toCurrencySelected], amount: amount, completion: { error in
                                            isLoading = false
                                            if error != nil {
                                                alertType = .apiFailed
                                                showAlert = true
                                            } else {
                                                updateResultData()
                                                isConversionSuccessful = true
                                            }
                                        })
                                    }
                                }
                            }
                        } header: {
                            Text(Constant.Strings.fromPickerHeader)
                        }
                        Section {
                            Picker(!currencyNames.isEmpty ? currencyNames[toCurrencySelected] : .empty, selection: $toCurrencySelected) {
                                ForEach(0 ..< currencyCodes.count, id: \.self) { index in
                                    Text(self.currencyCodes[index]).tag(index).disabled(index == fromCurrencySelected)
                                }
                            }.onChange(of: toCurrencySelected) { newValue in
                                if isConversionSuccessful {
                                    if let validationError = viewModel.checkFormValidation(amount: amount) {
                                        alertType = validationError
                                    } else {
                                        isLoading = true
                                        viewModel.fetchConversionResult(from: currencyCodes[fromCurrencySelected], to: currencyCodes[newValue], amount: amount, completion: { error in
                                            isLoading = false
                                            if error != nil {
                                                    alertType = .apiFailed
                                                showAlert = true
                                            } else {
                                                updateResultData()
                                                isConversionSuccessful = true
                                            }
                                        })
                                    }
                                }
                            }
                        } header: {
                            Text(Constant.Strings.toPickerHeader)
                        }

                        Section {
                            TextField(Constant.Strings.amountPlaceholder, text: $amount)
                                .keyboardType(.decimalPad)
                                .toolbar {
                                    ToolbarItem(placement: .keyboard) {
                                        HStack {
                                            Spacer()
                                            Button(Constant.Strings.done) {
                                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                            }
                                        }
                                    }
                                }
                        } header: {
                            Text(!currencyNames.isEmpty ? "\(currencyNames[fromCurrencySelected])" : .empty)
                        }
                        if isConversionSuccessful && !amount.isEmpty {
                            Section {
                                Text(resultAmount)
                            } header: {
                                Text("\(Constant.Strings.convertResultTitle) \(!currencyNames.isEmpty ? "\(currencyNames[toCurrencySelected])": .empty)")
                            }

                            Section {
                                VStack(alignment:.leading){
                                    Text("\(Constant.Strings.lastUpdateTime)\(Date.getFormattedDate(string: viewModel.conversionResult?.time_last_update_utc ?? .empty))")
                                    Text("\(Constant.Strings.conversionRate)\(String(format: "%.2f", viewModel.conversionResult?.conversion_rate ?? 0.0))")
                                }
                            } header: {
                                Text(Constant.Strings.detailsHeader)
                            }
                        }
                    }
                    HStack {
                        Button (action: {
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            if let validationError = viewModel.checkFormValidation(amount: amount) {
                                alertType = validationError
                                showAlert = true
                            } else {
                                isLoading = true
                                viewModel.fetchConversionResult(from: currencyCodes[fromCurrencySelected], to: currencyCodes[toCurrencySelected], amount: amount, completion: { error in
                                    isLoading = false
                                    if error != nil {
                                        alertType = .apiFailed
                                        showAlert = true
                                    } else {
                                        updateResultData()
                                        isConversionSuccessful = true
                                    }
                                })
                            }
                        }, label: {
                            Text(Constant.Strings.convertButtonTitle)
                                .bold()
                                .frame(height: 36)
                                .frame(maxWidth: .infinity)
                        })
                            .foregroundColor(.white)
                            .background(Color.black.opacity(amount.isEmpty ? 0.5 : 1))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .disabled(amount.isEmpty)
                        
                        if isConversionSuccessful && !amount.isEmpty {
                            Spacer()
                                .frame(width: 10)

                            Button (action: {
                                isConversionSuccessful = false
                                resetData()
                            }, label: {
                                Text(Constant.Strings.resetButtonTitle)
                                    .bold()
                                    .frame(height: 36)
                                    .frame(maxWidth: .infinity)
                            })
                                .foregroundColor(.white)
                                .background(Color.red)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 40, height: 40, alignment: .center)
                    if let tnc = URL(string: viewModel.availableCurrency?.terms_of_use ?? .empty), let documentation = URL(string: viewModel.availableCurrency?.documentation ?? .empty){
                        HStack {
                            Link(destination: tnc, label: {
                                Text(Constant.Strings.termsOfUse)
                            })
                            Spacer()
                            Link(destination: documentation, label: {
                                Text(Constant.Strings.documentation)
                            })
                        }.padding()
                    }
                }
                if isLoading {
                    Color.black.opacity(0.2)
                    VStack{
                        Spacer()
                        CustomLoader(color: .black, background: .black, size: .medium)
                        Spacer()
                    }
                }
            }
            .onAppear {
                isLoading = true
                viewModel.getAvailableCurrencies(completion: { codes, names, error in
                    isLoading = false
                    if error != nil {
                        showAlert = true
                        alertType = .apiFailed
                    }
                    currencyCodes = codes
                    currencyNames = names
                })
            }
            .navigationBarTitle(Constant.Strings.pageTitle)
            .navigationBarTitleDisplayMode(.inline)
            .alert(isPresented: $showAlert) {
                var description: String = .empty
                switch alertType {
                case .emptyAmount:
                    description = Constant.AlertValues.amountEmpty
                case .apiFailed:
                    description = Constant.AlertValues.apiError
                }
                return Alert(title: Text(Constant.AlertValues.title), message: Text(description), dismissButton: .cancel(Text(Constant.AlertValues.okButton), action: {
                    showAlert = false
                }))
            }
        }
    }

    func updateResultData() {
        resultAmount = "\(String(format: "%.2f", viewModel.conversionResult?.conversion_result ?? 0.0))"
        lastUpdatedTime = "\(Date.getFormattedDate(string: viewModel.conversionResult?.time_last_update_utc ?? .empty))"
    }
    
    func resetData() {
        amount = .empty
    }
}

struct ConversionView_Previews: PreviewProvider {
    static var previews: some View {
        ConversionView()
    }
}
