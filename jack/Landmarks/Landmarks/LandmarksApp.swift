//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by 권재욱 on 2023/05/25.
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
