//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by ChangMin on 2023/06/13.
//

import SwiftUI

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
    // TODO: scenePhase가 뭐야?
    @Environment(\.scenePhase) private var scenePhase
    @State private var isPresentingNewScrumView = false
    
    let saveAction: () -> Void
    
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(
                scrums: $scrums,
                isPresentingNewScrumView: $isPresentingNewScrumView
            )
        }
        // TODO: .onChange는 어떤 역할을 하지?, phase는 뭐지?
        .onChange(of: scenePhase) { phase in
            if phase == .inactive {
                saveAction()
            }
        }
    }
}

//#Preview {
//    ScrumsView(scrums: DailyScrum.sampleData)
//}
struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(
            scrums: .constant(DailyScrum.sampleData),
            saveAction: {}
        )
    }
}
