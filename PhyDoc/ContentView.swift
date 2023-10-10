//
//  ContentView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            NavigationLink {
                RegistrationView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Записаться")
                    .padding(16)
                    .frame(maxWidth: 210, minHeight: 56, maxHeight: 56, alignment: .center)
                    .background(Color(red: 0.27, green: 0.21, blue: 1))
                    .cornerRadius(28)
                    .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
