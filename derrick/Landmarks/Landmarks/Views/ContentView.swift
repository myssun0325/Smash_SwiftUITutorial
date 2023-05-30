//
//  ContentView.swift
//  Landmarks
//
//  Created by Derrick kim on 2023/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Tab = .featured
    @StateObject private var modelData = ModelData()

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
        .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
