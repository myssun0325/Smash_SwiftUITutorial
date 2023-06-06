//
//  ContentView.swift
//  MacLandmarks
//
//  Created by Derrick kim on 2023/05/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
               .frame(minWidth: 700, minHeight: 300)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
