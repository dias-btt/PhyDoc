//
//  ChoosePatientView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import SwiftUI

struct ChoosePatientView: View {
    @State private var myself = true
    @State private var other = false
    @State private var fullname = "Иванов Иван"
    @State private var iin = "041115486195"
    @State private var phone = "+7 707 748 4815"
    @State private var address = "ул. Гани Иляева 15"
    @State private var isChooseTimeViewActive = false
    
    
    var body: some View {
        VStack{
            // progress tab
            HStack{
                Spacer()
                
                HStack(alignment: .top, spacing: 8) {
                    Rectangle()
                        .modifier(ProgressTabModifier(progress: true))
                    Rectangle()
                        .modifier(ProgressTabModifier(progress: true))
                    Rectangle()
                        .modifier(ProgressTabModifier(progress: false))
                }
                .padding(0)
                .frame(width: 100, height: 6, alignment: .topLeading)
                
                Spacer()
                
                NavigationLink{
                    ContentView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                        HStack(alignment: .top, spacing: 8) {
                            Image("Vector")
                                .frame(width: 12, height: 12)
                                .background(Color(red: 0.4, green: 0.44, blue: 0.52))
                        }
                        .padding(10)
                        .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                        .cornerRadius(58)
                    }
            }
            .padding(.leading)
            
            // Choose patient
            VStack(alignment: .leading, spacing: 32) {
                
                // Header
                VStack(alignment: .leading, spacing: 32) {
                    Text("Выберите кого хотите записать")
                        .font(
                            Font.custom("Onest", size: 32)
                                .weight(.medium)
                        )
                        .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                }
                .padding(0)
                .frame(width: 320, alignment: .topLeading)
                
                // себя или другого
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .top, spacing: 12) {
                        // Себя
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                // Text/Bold 16pt
                                Text("Себя")
                                    .font(
                                        Font.custom("Onest", size: 16)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(myself ? Color(red: 0.99, green: 0.99, blue: 0.99) : Color(red: 0.06, green: 0.09, blue: 0.16))
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(myself ? Color(red: 0.27, green: 0.21, blue: 1) : .white)
                            .cornerRadius(10)
                        }
                        .onTapGesture {
                            if !myself && other{
                                myself.toggle()
                                other.toggle()
                            }
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        
                        // Другого
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                // Text/Bold 16pt
                                Text("Другого")
                                    .font(
                                        Font.custom("Onest", size: 16)
                                            .weight(.bold)
                                    )
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(other ? Color(red: 0.99, green: 0.99, blue: 0.99) : Color(red: 0.06, green: 0.09, blue: 0.16))
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(other ? Color(red: 0.27, green: 0.21, blue: 1) : .white)
                            .cornerRadius(10)
                        }
                        .onTapGesture {
                            if myself && !other{
                                other.toggle()
                                myself.toggle()
                            }
                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(6)
                    .frame(width: 320, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 1)
                    )
                }
                .padding(0)
                
                if myself{
                    // name and surname
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Имя и фамилия:")
                            .modifier(TextModifier(choice: "header"))
                        Text(fullname)
                            .modifier(TextModifier(choice: ""))
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                    
                    // IIN
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ИИН:")
                            .modifier(TextModifier(choice: "header"))
                        Text(iin)
                            .modifier(TextModifier(choice: ""))
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                    
                    // phone number
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Номер телефона:")
                            .modifier(TextModifier(choice: "header"))
                        Text(phone)
                            .modifier(TextModifier(choice: ""))
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                    
                    // street
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Адрес прописки:")
                            .modifier(TextModifier(choice: "header"))
                        Text(address)
                            .modifier(TextModifier(choice: ""))
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                }
                
                if other{
                    VStack(alignment: .leading, spacing: 16) {
                        // name surname
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Имя и фамилия")
                                .modifier(TextModifier(choice: ""))
                            HStack(alignment: .center, spacing: 8) {
                                TextField("Иванов Иван", text: $fullname)
                            }
                            .modifier(TextFieldModifier())
                        }
                        .padding(0)
                        .frame(width: 328, alignment: .topLeading)
                        
                        // ИИН
                        VStack(alignment: .leading, spacing: 8) {
                            Text("ИИН")
                                .modifier(TextModifier(choice: ""))
                            HStack(alignment: .center, spacing: 8) {
                                TextField("Введите ИИН человека", text: $iin)
                            }
                            .modifier(TextFieldModifier())
                        }
                        .padding(0)
                        .frame(width: 328, alignment: .topLeading)
                        
                        // phone
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Номер телефона")
                                .modifier(TextModifier(choice: ""))
                            HStack(alignment: .center, spacing: 8) {
                                TextField("Введите номер телефона", text: $phone)
                            }
                            .modifier(TextFieldModifier())
                        }
                        .padding(0)
                        .frame(width: 328, alignment: .topLeading)
                        
                        // phone
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Адрес")
                                .modifier(TextModifier(choice: ""))
                            HStack(alignment: .center, spacing: 8) {
                                TextField("Адрес прописки", text: $address)
                            }
                            .modifier(TextFieldModifier())
                        }
                        .padding(0)
                        .frame(width: 328, alignment: .topLeading)
                    }
                    .padding(0)
                }
            }
            
            Spacer()
            
            // Back and Next buttons
            HStack(alignment: .top, spacing: 12) {
                // Back
                NavigationLink {
                    RegistrationView()                        .navigationBarBackButtonHidden(true)
                } label: {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .center, spacing: 8) {
                            Image("left arrow")
                                .frame(width: 24, height: 24)
                            // Text/Bold 16pt
                            Text("Назад")
                                .font(
                                    Font.custom("Onest", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                        .background(.white)
                        .cornerRadius(28)
                        .overlay(
                            RoundedRectangle(cornerRadius: 28)
                                .inset(by: 1)
                                .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 2)
                        )
                    }
                }
                
                
                // Next
                NavigationLink(
                    destination: ChooseTimeView()
                        .navigationBarBackButtonHidden(true),
                    isActive: $isChooseTimeViewActive
                    ) {
                        EmptyView()
                    }
                    .opacity(0)
                Button(action: {
                    ChooseTimeViewModel.shared.fullname = fullname
                    isChooseTimeViewActive = true
                }) {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack(alignment: .center, spacing: 8) {
                            Text("Дальше")
                                .font(
                                    Font.custom("Onest", size: 16)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(red: 0.99, green: 0.99, blue: 0.99))
                        }
                        .padding(16)
                        .frame(maxWidth: .infinity, minHeight: 56, maxHeight: 56, alignment: .center)
                        .background(Color(red: 0.27, green: 0.21, blue: 1))
                        .cornerRadius(28)
                    }
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .padding(0)
            }
            .frame(width: 320, alignment: .topLeading)
            .padding(0)
        }
    }
}

struct ChoosePatientView_Previews: PreviewProvider {
    static var previews: some View {
        ChoosePatientView()
    }
}
