//
//  RegistrationView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import SwiftUI

struct RegistrationView: View {
    @Environment (\.dismiss) var dismiss

    @State private var onlineClicked = false
    @State private var offlineClicked = false
    @State private var homeClicked = false
    
    @State private var consultationType = ""
    
    var body: some View {
            VStack{
                // progress tab
                HStack{
                    Spacer()
                    HStack(alignment: .top, spacing: 8) {
                        Rectangle()
                            .modifier(ProgressTabModifier(progress: true))
                        Rectangle()
                            .modifier(ProgressTabModifier(progress: false))
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
                
                // Choose consultation
                VStack(alignment: .leading, spacing: 32) {
                    
                    // Header
                    VStack(alignment: .leading, spacing: 32) {
                        Text("Выберите формат приема")
                            .font(
                                Font.custom("Onest", size: 32)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(width: 320, alignment: .topLeading)
                    
                    // Choose type
                    VStack(alignment: .leading, spacing: 16) {
                        // Online
                        
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                // Header/H3
                                Text("Онлайн-консультация")
                                    .font(
                                        Font.custom("Onest", size: 20)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text("Врач созвонится с вами и проведет консультацию в приложении.")
                                    .font(Font.custom("Onest", size: 16))
                                    .foregroundColor(Color(red: 0.27, green: 0.4, blue: 0.52))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .background(onlineClicked
                                    ? Color(red: 0.93, green: 0.92, blue: 1)
                                    : Color(red: 0.94, green: 0.95, blue: 0.96))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(onlineClicked
                                        ? Color(red: 0.27, green: 0.21, blue: 1)
                                        : Color(red: 0.94, green: 0.95, blue: 0.96),
                                        lineWidth: 2)
                        )
                        .onTapGesture {
                            if offlineClicked{
                                offlineClicked.toggle()
                            }
                            if homeClicked{
                                homeClicked.toggle()
                            }
                            onlineClicked.toggle()
                            
                            consultationType = onlineClicked ? "online" : ""
                            ChooseTimeViewModel.shared.consultationType = consultationType
                        }
                        
                        // Offline
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                // Header/H3
                                Text("Записаться в клинику")
                                    .font(
                                        Font.custom("Onest", size: 20)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text("Врач будет ждать вас в своем кабинете в клинике.")
                                    .font(Font.custom("Onest", size: 16))
                                    .foregroundColor(Color(red: 0.27, green: 0.4, blue: 0.52))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .background(offlineClicked
                                    ? Color(red: 0.93, green: 0.92, blue: 1)
                                    : Color(red: 0.94, green: 0.95, blue: 0.96))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(offlineClicked
                                        ? Color(red: 0.27, green: 0.21, blue: 1)
                                        : Color(red: 0.94, green: 0.95, blue: 0.96),
                                        lineWidth: 2)
                        )
                        .onTapGesture {
                            if onlineClicked{
                                onlineClicked.toggle()
                            }
                            if homeClicked{
                                homeClicked.toggle()
                            }
                            offlineClicked.toggle()
                            
                            consultationType = offlineClicked ? "offline" : ""
                            ChooseTimeViewModel.shared.consultationType = consultationType
                        }
                        
                        // At home
                        VStack(alignment: .leading, spacing: 12) {
                            VStack(alignment: .leading, spacing: 4) {
                                // Header/H3
                                Text("Вызвать на дом")
                                    .font(
                                        Font.custom("Onest", size: 20)
                                            .weight(.medium)
                                    )
                                    .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                                Text("Врач сам приедет к вам домой в указанное время и дату.")
                                    .font(Font.custom("Onest", size: 16))
                                    .foregroundColor(Color(red: 0.27, green: 0.4, blue: 0.52))
                                    .frame(maxWidth: .infinity, alignment: .topLeading)
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                        }
                        .padding(20)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .background(homeClicked
                                    ? Color(red: 0.93, green: 0.92, blue: 1)
                                    : Color(red: 0.94, green: 0.95, blue: 0.96))
                        .cornerRadius(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1)
                                .stroke(homeClicked
                                        ? Color(red: 0.27, green: 0.21, blue: 1)
                                        : Color(red: 0.94, green: 0.95, blue: 0.96),
                                        lineWidth: 2)
                        )
                        .onTapGesture {
                            if onlineClicked{
                                onlineClicked.toggle()
                            }
                            if offlineClicked{
                                offlineClicked.toggle()
                            }
                            homeClicked.toggle()
                            
                            consultationType = homeClicked ? "offline" : ""
                            ChooseTimeViewModel.shared.consultationType = consultationType
                        }
                        
                        
                    }
                    .padding(0)
                    .frame(width: 320, alignment: .topLeading)
                    
                }
                
                Spacer()
                
                // Back and Next Buttons
                HStack(alignment: .top, spacing: 12) {
                    // Back
                    NavigationLink {
                        ContentView()
                            .navigationBarBackButtonHidden(true)
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
                    if onlineClicked || offlineClicked || homeClicked{
                        NavigationLink {
                            ChoosePatientView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(alignment: .center, spacing: 8) {
                                    // Text/Bold 16pt
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
                }
                
            }
            .frame(width: 320, alignment: .topLeading)
            .padding(0)
        }
    }
struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
