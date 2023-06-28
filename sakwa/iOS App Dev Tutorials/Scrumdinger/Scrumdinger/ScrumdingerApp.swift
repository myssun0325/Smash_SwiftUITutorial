//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by ChangMin on 2023/06/06.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
