//
//  Time.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 07.10.2023.
//

import Foundation

struct TimeData: Codable {
    let slots: [Time]
}

struct Time: Identifiable, Hashable, Codable{
    let id: Int
    let datetime: String
    let price: Int
}

extension TimeData{
    static var MOCK_TIME: [Time] = [
        .init(id: 1, datetime: "2023-11-25T11:00:00", price: 4000),
        .init(id: 2, datetime: "2023-11-25T13:00:00", price: 4000),
        .init(id: 3, datetime: "2023-11-25T15:00:00", price: 4000),
        .init(id: 4, datetime: "2023-11-25T17:00:00", price: 4000),
        .init(id: 5, datetime: "2023-11-25T19:00:00", price: 4000),
        .init(id: 6, datetime: "2023-11-26T11:00:00", price: 4000),
        .init(id: 7, datetime: "2023-11-26T13:00:00", price: 4000),
        .init(id: 8, datetime: "2023-11-26T15:00:00", price: 4000),
        .init(id: 9, datetime: "2023-11-26T17:00:00", price: 4000),
        .init(id: 10, datetime: "2023-11-26T19:00:00", price: 4000),
    ]
}
