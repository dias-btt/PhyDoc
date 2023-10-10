//
//  TextModifier.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import Foundation
import SwiftUI

struct TextModifier: ViewModifier{
    var choice: String
    func body(content: Content) -> some View{
        content
            .font(choice == "header" ? Font.custom("Onest", size: 16) : Font.custom("Onest", size: 18))
            .foregroundColor(choice == "header" ? Color(red: 0.4, green: 0.44, blue: 0.52) : Color(red: 0.06, green: 0.09, blue: 0.16))
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}
