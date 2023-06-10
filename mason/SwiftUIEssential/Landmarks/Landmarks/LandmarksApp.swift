//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by YoungsunMoon on 2023/05/20.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
