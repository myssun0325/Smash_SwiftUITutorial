//
//  KeywordBubble.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/13.
//

import SwiftUI

struct KeywordBubble: View {
    let keyword: String
    let symbol: String
    @ScaledMetric(relativeTo: .title) var paddingwidth = 14.5
    
    var body: some View {
        Label(keyword, systemImage: symbol)
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(paddingwidth)
            .background(.purple.opacity(0.75), in: Capsule())
//            .background(
//                .purple.opacity(0.75),
//                in: UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 15, bottomLeading: 0, bottomTrailing: 0, topTrailing: 15)))
           
    }
}

let keywords = ["chives", "fern-leaf lavender"]
#Preview {
    VStack {
        ForEach(keywords, id: \.self) { word in
            KeywordBubble(keyword: word, symbol: "leaf")
        }
     }
}
