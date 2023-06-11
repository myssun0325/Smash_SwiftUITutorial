//
//  JournalEntryView.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct JournalEntryView: View {
    let journalEntry: JournalEntry

    private var title: String {
        journalEntry.createdDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year())
    }

    var body: some View {
        ScrollView {
            Text(journalEntry.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        #if os(iOS)
        .navigationTitle(title)
        #elseif os(macOS)
        .navigationSubtitle(title)
        #endif
    }
}
