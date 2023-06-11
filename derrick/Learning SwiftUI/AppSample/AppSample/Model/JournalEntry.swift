//
//  JournalEntry.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct JournalEntry: Identifiable, Hashable {
    let id = UUID()
    let createdDate: Date
    var text = ""

    init(createdDate: Date = Date(), text: String = "") {
        self.createdDate = createdDate
        self.text = text
    }
}
