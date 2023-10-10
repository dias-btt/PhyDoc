//
//  ConfirmationView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 08.10.2023.
//

import SwiftUI

struct ConfirmationView: View {
    @State private var isSuccessViewActive = false
    
    private func createAppointment() {
            let url = URL(string: "https://phydoc-test-2d45590c9688.herokuapp.com/appoint")!
            let appointmentData: [String: Any] = [
                "slot_id": 1,
                "type": ChooseTimeViewModel.shared.consultationType,
                "fullname": ChooseTimeViewModel.shared.fullname,
                "price": ChooseTimeViewModel.shared.price,
                "time": ChooseTimeViewModel.shared.time,
                "date": ChooseTimeViewModel.shared.date
            ]

            guard let jsonData = try? JSONSerialization.data(withJSONObject: appointmentData) else {
                // Handle JSON serialization error
                return
            }

            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error creating appointment: \(error)")
                    // Handle the error
                    return
                }

                if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) {
                    // Appointment created successfully, you can handle the success here
                    print("Appointment created successfully")
                } else {
                    // Handle the HTTP error status code
                    print("Failed to create appointment. Status code: \(response?.description ?? "Unknown")")
                }
            }.resume()
        }
    
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
            
            // warning
            VStack(alignment: .leading, spacing: 32) {
                
                // Header and warning
                VStack(alignment: .leading, spacing: 16) {
                    // header
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Потдвердите   запись")
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
                    
                }
                .padding(0)
                .frame(width: 320, alignment: .topLeading)
            }
            .padding(0)
            
            VStack(alignment: .leading, spacing: 16) {
                // chat
                HStack(alignment: .center, spacing: 16) {
                    // avatar
                    VStack(alignment: .leading, spacing: 8) {  }
                    .padding(8)
                    .frame(width: 72, height: 72, alignment: .topLeading)
                    .background(
                      Image("Avatar")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 72, height: 72)
                        .clipped()
                    )
                    .cornerRadius(36)
                    
                    // doc info
                    VStack(alignment: .leading, spacing: 1) {
                        // Text/Bold 16pt
                        Text("Оксана Михайловна")
                          .font(
                            Font.custom("Onest", size: 16)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                          .frame(maxWidth: .infinity, minHeight: 23, maxHeight: 23, alignment: .topLeading)
                        // Text/Regular 16pt
                        Text("Офтальмолог")
                          .font(Font.custom("Onest", size: 16))
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        HStack(alignment: .center, spacing: 8) {
                            HStack(alignment: .center, spacing: 4) {
                                Image("star")
                                .frame(width: 18, height: 18)
                                // Text/Regular 16pt
                                Text("4,9")
                                  .font(Font.custom("Onest", size: 16))
                                  .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                            }
                            .padding(0)
                            Image("Ellipse 25")
                            .frame(width: 4, height: 4)
                            .background(Color(red: 0.6, green: 0.64, blue: 0.7))
                            // Text/Regular 16pt
                            Text("Шымкент")
                              .font(Font.custom("Onest", size: 16))
                              .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                        }
                        .padding(0)
                    }
                    .padding(0)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    
                    // chat button
                    Button {
                        // chat
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                Image("chat")
                                .frame(width: 20, height: 20)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.white)
                            .cornerRadius(28)
                            .overlay(
                              RoundedRectangle(cornerRadius: 28)
                                .inset(by: 1)
                                .stroke(Color(red: 0.82, green: 0.84, blue: 0.87), lineWidth: 2)
                            )
                        }
                        .padding(0)
                        .frame(width: 20, height: 20)
                    }
                    
                    

                }
                .padding(0)
                .frame(width: 320, alignment: .leading)
                .padding(.top)
                
                // chosen features
                HStack(alignment: .center, spacing: 12) {
                    // time
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Время")
                          .font(
                            Font.custom("Onest", size: 12)
                              .weight(.bold)
                          )
                          .kerning(0.48)
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                        // Header/H2
                        Text(ChooseTimeViewModel.shared.time)
                          .font(
                            Font.custom("Onest", size: 20)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                    .cornerRadius(12)
                    
                    // date
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Дата")
                          .font(
                            Font.custom("Onest", size: 12)
                              .weight(.bold)
                          )
                          .kerning(0.4)
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                        // Header/H2
                        Text(ChooseTimeViewModel.shared.date.prefix(7))
                          .font(
                            Font.custom("Onest", size: 18)
                              .weight(.bold)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                    .cornerRadius(12)
                    
                    // price
                    VStack(alignment: .leading, spacing: 0) {
                        // Text/Bold 12pt Upper
                        Text("Цена")
                          .font(
                            Font.custom("Onest", size: 12)
                              .weight(.bold)
                          )
                          .kerning(0.48)
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                        HStack(alignment: .firstTextBaseline, spacing: 4) {
                            HStack(alignment: .center, spacing: 8) {
                                // Header/H2
                                Text(String(ChooseTimeViewModel.shared.price) + "₸")
                                  .font(
                                    Font.custom("Onest", size: 20)
                                      .weight(.bold)
                                  )
                                  .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                            }
                            .padding(0)
                        }
                        .padding(0)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                    .cornerRadius(12)
                }
                .padding(0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .cornerRadius(12)
                
                // format and patient
                VStack(alignment: .leading, spacing: 20) {
                    // format
                    VStack(alignment: .leading, spacing: 8) {
                        // Text/Regular 16pt
                        Text("Формат приема:")
                          .font(Font.custom("Onest", size: 16))
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        // Text/Medium 18pt
                        Text(ChooseTimeViewModel.shared.consultationType == "offline" ? "Оффлайн-консультация" : "Онлайн-консультация")
                          .font(
                            Font.custom("Onest", size: 18)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                    
                    // patient
                    VStack(alignment: .leading, spacing: 8) {
                        // Text/Regular 16pt
                        Text("Пациент:")
                          .font(Font.custom("Onest", size: 16))
                          .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                        // Text/Medium 18pt
                        Text(ChooseTimeViewModel.shared.fullname)
                          .font(
                            Font.custom("Onest", size: 18)
                              .weight(.medium)
                          )
                          .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                          .frame(maxWidth: .infinity, alignment: .topLeading)
                    }
                    .padding(0)
                    .frame(width: 319, alignment: .topLeading)
                }
                .padding(0)
                .padding(.top)
                
                Spacer()
                
                // payment
                Button {
                    // payment
                } label: {
                    HStack(alignment: .center, spacing: 12) {
                        HStack(alignment: .center, spacing: 16) {
                            Image("Visa")
                            .frame(width: 35.00001, height: 24)
                            VStack(alignment: .leading, spacing: 0) {
                                // Text/Bold 16pt
                                Text("•••• 4515")
                                  .font(
                                    Font.custom("Onest", size: 16)
                                      .weight(.bold)
                                  )
                                  .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                                // Text/Regular 14pt
                                Text("03/24")
                                  .font(Font.custom("Onest", size: 14))
                                  .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                            }
                            .padding(0)
                            .frame(maxWidth: .infinity, alignment: .topLeading)
                            // Header/H3
                            Text("4500₸")
                              .font(
                                Font.custom("Onest", size: 20)
                                  .weight(.medium)
                              )
                              .multilineTextAlignment(.center)
                              .foregroundColor(Color(red: 0.06, green: 0.09, blue: 0.16))
                            Image("down arrow")
                            .frame(width: 24, height: 24)
                        }
                        .padding(.leading, 16)
                        .padding(.trailing, 12)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color(red: 0.94, green: 0.95, blue: 0.96))
                        .cornerRadius(16)
                    }
                    .padding(0)
                    .frame(width: 320, alignment: .leading)
                }
                
                
                HStack(alignment: .top, spacing: 12) {
                    
                    NavigationLink {
                        ChooseTimeView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                Image("left arrow")
                                .frame(width: 24, height: 24)
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
                        .padding(0)
                    }

                    
                    NavigationLink(
                        destination: SuccessView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $isSuccessViewActive
                        ) {
                            EmptyView()
                        }
                        .opacity(0)
                    Button(action: {
                        createAppointment()
                        isSuccessViewActive = true
                    }){
                        VStack(alignment: .leading, spacing: 8) {
                            HStack(alignment: .center, spacing: 8) {
                                // Text/Bold 16pt
                                    Text("Подтвердить")
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
                        .padding(0)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                    }

                }
                .padding(0)
                .frame(width: 320, alignment: .topLeading)
            }
            .padding(0)
        }
        .frame(width: 320, alignment: .topLeading)
        .padding(0)
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}
