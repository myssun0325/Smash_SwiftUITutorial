//
//  ContentView.swift
//  WatchLanmarks Watch App
//
//  Created by Derrick kim on 2023/05/31.
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
