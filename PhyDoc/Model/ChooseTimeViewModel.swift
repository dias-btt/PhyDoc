//
//  ChooseTimeViewModel.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 09.10.2023.
//

import Foundation

class ChooseTimeViewModel{
    
    static let shared = ChooseTimeViewModel()
    
    var consultationType: String = ""
    var fullname: String = "Иванов Иван"
    var time: String = ""
    var date: String = ""
    var price: Int = -1
    
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

}
