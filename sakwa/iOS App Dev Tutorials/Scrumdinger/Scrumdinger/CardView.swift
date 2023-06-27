//
//  CardView.swift
//  Scrumdinger
//
//  Created by ChangMin on 2023/06/12.
//

import SwiftUI

struct CardView: View {
    let scrum: DailyScrum
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            
            HStack {
                Label("\(scrum.attendees.count)", systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
    }
}

//#Preview {
//    CardView(scrum: DailyScrum.sampleData[0])
//        .background(DailyScrum.sampleData[0].theme.mainColor)
//        .previewLayout(.fixed(width: 400, height: 400))
//}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(scrum: DailyScrum.sampleData[0])
            .background(DailyScrum.sampleData[0].theme.mainColor)
            .previewLayout(.fixed(width: 400, height: 400))
    }
}

