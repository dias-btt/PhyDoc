//
//  ChooseTimeView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 04.10.2023.
//

import SwiftUI


struct ChooseTimeView: View {
    @State private var timesData: [Time] = []
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
                        .modifier(ProgressTabModifier(progress: true))
                }
                .padding(0)
                .frame(width: 100, height: 6, alignment: .topLeading)
                
                Spacer()
                
                NavigationLink {
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
            
            VStack(alignment: .leading, spacing: 32) {
                
                // Header and warning
                VStack(alignment: .leading, spacing: 16) {
                    // header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Выберите дату и время")
                          .font(
                            Font.custom("Onest", size: 32)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    // warning
                    HStack(alignment: .top, spacing: 8) {
                        Image("exclamation triangle")
                        .frame(width: 24, height: 24)
                        
                        // warning text
                        VStack(alignment: .leading, spacing: 8) {
                            // Text/Regular 16pt
                            Text("Отмена и изменение времени приема может стоит денег.")
                              .font(Font.custom("Onest", size: 16))
                              .foregroundColor(Color(red: 0.5, green: 0.19, blue: 0.02))
                              .frame(maxWidth: .infinity, alignment: .topLeading)
                            Button {
                                //
                            } label: {
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(alignment: .center, spacing: 8) {
                                        // Text/Medium 16pt
                                        Text("Подробнее")
                                          .font(
                                            Font.custom("Onest", size: 16)
                                              .weight(.medium)
                                          )
                                          .multilineTextAlignment(.center)
                                          .foregroundColor(Color(red: 0.5, green: 0.19, blue: 0.02))
                                    }
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .background(.white)
                                    .cornerRadius(16)
                                }
                                .padding(0)
                            }

                        }
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(red: 0.99, green: 0.94, blue: 0.86))
                    .cornerRadius(12)
                    
                    // date
                    TimeGridView(times: timesData)
                        .padding(.horizontal, -15)
                        .onAppear{
                            fetchData()
                        }
                }
                .padding(0)
                .frame(width: 320, alignment: .topLeading)
            }
            .padding(0)
            
            Spacer()
            
            HStack(alignment: .top, spacing: 12) {
                // Back
                
                NavigationLink {
                    ChoosePatientView()                        .navigationBarBackButtonHidden(true)
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
                    NavigationLink {
                        ConfirmationView()
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
        .frame(width: 320, alignment: .topLeading)
        .padding(0)
    }
    
    private func fetchData() {
        guard let url = URL(string: "https://phydoc-test-2d45590c9688.herokuapp.com/get_schedule?type=\(ChooseTimeViewModel.shared.consultationType)") else {
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error fetching data: \(error)")
            } else if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let timeData = try decoder.decode(TimeData.self, from: data)
                    timesData = timeData.slots
                    
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }

}
struct ChooseTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseTimeView()
    }
}
