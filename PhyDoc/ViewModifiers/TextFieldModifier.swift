//
//  TextFieldModifier.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import Foundation
import SwiftUI

struct TextFieldModifier: ViewModifier{
    func body(content: Content) -> some View{
        content
            .padding(16)
            .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .leading)
            .background(.white)
            .cornerRadius(12)
            .overlay(
              RoundedRectangle(cornerRadius: 12)
                .inset(by: 1)
                .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 2)
            )
    }
}
