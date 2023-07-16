/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@main
struct ScrumdingerApp: App {
    @StateObject private var store = ScrumStore()

    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                // Save Action 클로저 넘기기 : inactive 시 저장하기 액션
                    Task {
                        do {
                            try await store.save(scrums: store.scrums)
                        } catch {
                            fatalError(error.localizedDescription)
                        }
                    }
                }
                // Adds an asynchronous task to perform before this view appears.
                .task {
                    do {
                        try await store.load()
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
        }
    }
}
