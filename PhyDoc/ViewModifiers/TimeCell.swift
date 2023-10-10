//
//  TimeCell.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 07.10.2023.

import SwiftUI

struct TimeCell: View{
    
    let time: Time
    @State var isClicked: Bool

    var body: some View{
        Button(action: {
            // Toggle the click state
            if isClicked == false{
                isClicked = true
                ChooseTimeViewModel.shared.time = String(time.datetime.components(separatedBy: "T")[1].prefix(5))
                ChooseTimeViewModel.shared.price = time.price
                ChooseTimeViewModel.shared.date = convertDate(date: time.datetime).components(separatedBy: ",")[0]
            } else{
                isClicked = false
            }
        }){
            VStack(alignment: .center, spacing: -2) {
                // Header/H3
                Text(time.datetime.components(separatedBy: "T")[1].prefix(5))
                    .font(
                        Font.custom("Onest", size: 20)
                            .weight(.medium)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(isClicked ? Color(red: 0.93, green: 0.92, blue: 1) : Color(red: 0.06, green: 0.09, blue: 0.16))
                // Text/Regular 16pt
                Text(String(time.price) + "T")
                    .font(Font.custom("Onest", size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(isClicked ? Color(red: 0.93, green: 0.92, blue: 1) : Color(red: 0.4, green: 0.44, blue: 0.52))
                                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .frame(maxWidth: .infinity, alignment: .top)
            .background(isClicked ? Color(red: 0.27, green: 0.21, blue: 1) : Color(red: 0.94, green: 0.95, blue: 0.96))
            .cornerRadius(16)
        }
    }

func convertDate(date: String) -> String{
    let dateString = date

    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    dateFormatter.locale = Locale(identifier: "ru_RU")

    if let date = dateFormatter.date(from: dateString) {
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = "dd MMMM"
        outputDateFormatter.locale = Locale(identifier: "ru_RU")
        
        let formattedDate = outputDateFormatter.string(from: date)
        
        let dayOfWeekFormatter = DateFormatter()
        dayOfWeekFormatter.dateFormat = "EEEE"
        dayOfWeekFormatter.locale = Locale(identifier: "ru_RU")
        let dayOfWeek = dayOfWeekFormatter.string(from: date)
        
        let result = "\(formattedDate), \(dayOfWeek)"
        
        return result
    } else {
        return "Invalid date format"
    }
}

