//
//  ContentView.swift
//  WatchLandmarks Watch App
//
//  Created by ChangMin on 2023/05/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
