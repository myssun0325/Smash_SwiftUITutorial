//
//  LandmarkSettings.swift
//  MacLandmarks
//
//  Created by Derrick kim on 2023/05/31.
//

import SwiftUI

struct LandmarkSettings: View {
    @AppStorage("MapView.zoom")
     private var zoom: MapView.Zoom = .medium

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct LandmarkSettings_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSettings()
    }
}
