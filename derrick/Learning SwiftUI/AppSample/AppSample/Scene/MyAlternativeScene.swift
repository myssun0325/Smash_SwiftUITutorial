//
//  MyAlternativeScene.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

struct MyAlternativeScene: Scene {
    var body: some Scene {
        WindowGroup {
            AlternativeContentView()
        }

        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
