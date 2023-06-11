//
//  AppSampleApp.swift
//  AppSample
//
//  Created by Derrick kim on 2023/06/11.
//

import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        #if os(iOS)
        MyScene()
        #elseif os(macOS)
        MyAlternativeScene()
        #endif
    }
}

