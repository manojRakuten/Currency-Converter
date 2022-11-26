//
//  CustomLoader.swift
//  CurrencyConverter
//
//  Created by Rana, Manoj on 26/11/22.
//

import SwiftUI

struct CustomLoader: View {
    @State private var isLoading = false
    var color: Color
    var background: Color
    var size: LoaderSize

        var body: some View {
            ZStack {
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(color, lineWidth: 3)
                    .frame(width: size.rawValue, height: size.rawValue)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.default.repeatForever(autoreverses: false), value: isLoading)
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(color, lineWidth: 3)
                    .frame(width: size.rawValue - (size.rawValue * 0.2), height: size.rawValue - (size.rawValue * 0.2))
                    .rotationEffect(Angle(degrees: isLoading ? 0 : 360))
                    .animation(Animation.default.repeatForever(autoreverses: false), value: isLoading)
            }
            .frame(width: size.rawValue * 2, height: size.rawValue * 2, alignment: .center)
            .background(background.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .onAppear() {
                self.isLoading = true
        }
        }
}

enum LoaderSize: CGFloat {
    case small = 30
    case medium = 50
    case large = 80
}

struct CustomLoader_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoader(color: .black, background: .black, size: .small)
    }
}
