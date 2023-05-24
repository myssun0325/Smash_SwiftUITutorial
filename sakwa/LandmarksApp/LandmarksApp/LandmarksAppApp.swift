//
//  LandmarksAppApp.swift
//  LandmarksApp
//
//  Created by ChangMin on 2023/05/22.
//

import SwiftUI

@main
struct LandmarksAppApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
