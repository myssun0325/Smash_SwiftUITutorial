//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by taehyeon.lee on 2023/06/08.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup { /* primitive scene들 중 하나 */
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
