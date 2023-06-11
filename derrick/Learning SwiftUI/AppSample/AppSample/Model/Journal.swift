//
//  Journal.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

class Journal: ObservableObject {
    @Published var entries: [JournalEntry] = [
        JournalEntry(
            createdDate: today(minus: 2),
            text: "우승할 줄 알았다."),
        JournalEntry(
            createdDate: today(minus: 5),
            text: "진짜 힘든 하루였음."),
    ]

    func addSampleEntry() {
        let entry = JournalEntry(
            createdDate: Date(),
            text: "새로운 기사야.")
        entries.append(entry)
    }

    private static func today(minus days: Int) -> Date {
        let dateComponents = DateComponents(day: -days)
        return Calendar.current.date(byAdding: dateComponents, to: Date()) ?? Date()
    }
}
