//
//  DetailView.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct DetailView: View {
    @Binding var selectedEntry: JournalEntry?

    var body: some View {
        if let entry = selectedEntry {
            JournalEntryView(journalEntry: entry)
        } else {
            Text("Select a journal entry")
        }
    }
}
