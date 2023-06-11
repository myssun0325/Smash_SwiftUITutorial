//
//  JournalEntryListItem.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct JournalEntryListItem: View {
    let journalEntry: JournalEntry

    var body: some View {
        VStack(alignment: .leading) {
            DateView(date: journalEntry.createdDate)
            Text("\(journalEntry.text)")
                .lineLimit(2)
        }
    }
}
