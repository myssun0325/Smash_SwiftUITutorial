//
//  AlternativeContentView.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct AlternativeContentView: View {
    @StateObject private var journal = Journal()
    @State private var selectedEntry: JournalEntry? = nil

    var body: some View {
        NavigationSplitView {
            List(journal.entries, selection: $selectedEntry) { entry in
                NavigationLink(value: entry) {
                    JournalEntryListItem(journalEntry: entry)
                }
            }
            .navigationSplitViewColumnWidth(min: 200, ideal: 200)
            #if os(iOS)
            .navigationBarTitleDisplayMode(.inline)
            #endif
            .toolbar {
                ToolbarItem {
                    Button {
                        journal.addSampleEntry()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        } detail: {
            DetailView(selectedEntry: $selectedEntry)
        }
    }
}
