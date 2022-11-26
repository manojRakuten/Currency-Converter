//
//  SpalshScreenView.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 25/11/22.
//

import SwiftUI

struct SpalshScreenView: View {
    @State private var isActive: Bool = false
    @State private var isAnimating: Bool = false
    @State private var size = 0.1

    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack{
                LinearGradient(colors: [.white,.blue, .indigo], startPoint: .top, endPoint: .bottom)
                VStack(spacing: 10) {
                    Constant.Images.splashLogo
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width - 60)
                        .aspectRatio(2, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                        .shadow(radius: 5.0)
                    Spacer()
                        .frame(height: 10)
                    VStack {
                        Text(Constant.Strings.pageTitle)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 20, weight: .bold, design: .rounded))
                            .foregroundColor(.indigo)
                    }
                    .frame(width: UIScreen.main.bounds.width - 60, height: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .shadow(radius: 5.0)
                    Spacer()
                        .frame(height: 10)
                }
            }.ignoresSafeArea()
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                    }
                })
                .ignoresSafeArea()
        }
    }
}

struct SpalshScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SpalshScreenView()
    }
}
