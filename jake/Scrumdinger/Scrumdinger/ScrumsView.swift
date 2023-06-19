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
        List(scrums) { scrum in /* DailyScrum이 Identifiable 이기 때문에 id 제거 가능 */
            CardView(scrum: scrum)
                .listRowBackground(scrum.theme.mainColor)
        }
    }
}

struct ScrumsView_Previews: PreviewProvider {
    static var previews: some View {
        ScrumsView(scrums: DailyScrum.sampleData)
    }
}
