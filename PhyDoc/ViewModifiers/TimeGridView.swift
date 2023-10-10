//
//  TimeGridView.swift
//  PhyDoc
//
//  Created by Диас Сайынов on 07.10.2023.
//

import SwiftUI

struct TimeGridView: View {
    let times: [Time]!

    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
        GridItem(.flexible(), spacing: 6),
    ]

    var body: some View {
        VStack {
            if let times = times, !times.isEmpty {
                let groupedTimes = Dictionary(grouping: times, by: { convertDate(date: $0.datetime) })

                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        ForEach(groupedTimes.keys.sorted(), id: \.self) { date in
                            Section(header: Text(date).font(
                                Font.custom("Onest", size: 20)
                                    .weight(.medium)
                            )
                            .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                            .frame(width: 320, alignment: .topLeading)) {
                                LazyVGrid(columns: columns, spacing: 6) {
                                    ForEach(groupedTimes[date]!, id: \.id) { time in
                                        TimeCell(time: time, isClicked: false)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
            } else {
                Text("Загружаем расписание")
                    .font(
                        Font.custom("Onest", size: 24) // Adjust the font size as needed
                            .weight(.bold)
                    )
                    .foregroundColor(Color(red: 0.4, green: 0.44, blue: 0.52))
                    .multilineTextAlignment(.center)
            }
        }
    }
}


struct TimeGridView_Previews: PreviewProvider {
    static var previews: some View {
        TimeGridView(times: TimeData.MOCK_TIME)
    }
}
