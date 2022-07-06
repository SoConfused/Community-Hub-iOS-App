//
//  Modifiers.swift
//  Community Hub
//
//  Created by Alan Guan on 6/25/22.
//

import Foundation
import SwiftUI

struct TextFieldUnderLines: ViewModifier {
    func body(content: Content) -> some View {
        content
            .overlay(VStack { Divider().offset(x: 0, y: 15) }) // Adds a underline for TextFields
            .disableAutocorrection(true) // Disables autocorretion
            .autocapitalization(.none) // Makes the first typed letter lowercase
    }
}

struct G7Text: ViewModifier {
    func body(content: Content) -> some View {
        content
            .border(.gray)
            .font(.custom("San Francisco", size: 21))
    }
}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
    }
}
