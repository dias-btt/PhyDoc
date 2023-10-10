//
//  ProgressTabModifier.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import Foundation
import SwiftUI

struct ProgressTabModifier: ViewModifier{
    var progress: Bool
    func body(content: Content) -> some View{
        content
            .foregroundColor(.clear)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(progress ? Color(red: 0.27, green: 0.21, blue: 1) : Color(red: 0.93, green: 0.92, blue: 1))
            .cornerRadius(4)
    }
}
