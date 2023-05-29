//
//  PageView.swift
//  Landmarks
//
//  Created by rieul on 2023-05-29.
//  
//

import SwiftUI

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            PageViewController(
                pages: pages,
                currentPage: $currentPage
            )
            Text("Current Page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
