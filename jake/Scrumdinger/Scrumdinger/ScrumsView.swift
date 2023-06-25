//
//  ScrumsView.swift
//  Scrumdinger
//
//  Created by taehyeon.lee on 2023/06/18.
//

import SwiftUI

struct ScrumsView: View {
    let scrums: [DailyScrum]

    var body: some View {
        NavigationStack { /* iOS 16 이상 */
            List(scrums) { scrum in /* DailyScrum이 Identifiable 이기 때문에 id 제거 가능 */
                NavigationLink(destination: DetailView(scrum: scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums") /* NavigationStack의 자식뷰에 선언해야 부모의 NavigationStack 컨텍스트에 선언된다. */
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
