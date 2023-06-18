//
//  Theme.swift
//  Scrumdinger
//
//  Created by taehyeon.lee on 2023/06/18.
//

import SwiftUI // View를 작성하는건 아니지만 Color property들을 사용하기 위해 가져옴. SwiftUI에서는 color들을 View의 인스턴스로 처리하기 때문에 view hierarchy에 바로 추가 가능하다.

enum Theme: String {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow

    var accentColor: Color {
        switch self {
        case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow:
            return .black
        case .indigo, .magenta, .navy, .oxblood, .purple:
            return .white
        }
    }

    var mainColor: Color {
        Color(rawValue)
    }
}
