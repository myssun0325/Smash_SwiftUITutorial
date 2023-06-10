//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by DongJin Lee on 2023/05/28.
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
