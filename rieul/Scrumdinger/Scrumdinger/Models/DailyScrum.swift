//
//  DailyScrum.swift
//  Scrumdinger
//
//  Created by rieul on 2023-06-17.
//
//

import Foundation

struct DailyScrum {
    var title: String
    /// 참석자
    var attendees: [String]
    var lengthInMinutes: Int
    var theme: Theme
}

extension DailyScrum {
    static let sampleData: [DailyScrum] = [
        DailyScrum(
            title: "Design",
            attendees: [
                "Cathy",
                "Daisy",
                "Simon",
                "Jonathan"
            ],
            lengthInMinutes: 10,
            theme: .yellow
        ),
        DailyScrum(
            title: "App Dev",
            attendees: [
                "Katie",
                "Gray",
                "Euna",
                "Luis",
                "Darla"
            ],
            lengthInMinutes: 5,
            theme: .orange
        ),
        DailyScrum(
            title: "Web Dev",
            attendees: [
                "Chella",
                "Chris",
                "Christina",
                "Eden",
                "Karla",
                "Lindsey",
                "Aga",
                "Chad",
                "Jenn",
                "Sarah"
            ],
            lengthInMinutes: 5,
            theme: .poppy
        )
    ]
}