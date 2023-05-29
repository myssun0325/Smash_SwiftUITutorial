//
//  ContentView.swift
//  Landmarks
//
//  Created by Derrick kim on 2023/05/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var modelData = ModelData()

    var body: some View {
        LandmarkList()
            .environmentObject(modelData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
