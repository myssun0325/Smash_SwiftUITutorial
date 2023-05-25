//
//  Badge.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/25.
//

import SwiftUI

struct Badge: View {
    var badgeSymbols: some View {
        ForEach(0..<8) { index in
            RotatedBadgeSymbol(
                angle: .degrees(Double(index) / Double(8)) * 360
            )
        }
        .opacity(0.5)
    }

    var body: some View {
        ZStack {
            BadgeBackground()

            GeometryReader { geometry in /* 부모 뷰와 device의 사이즈와 위치정보를 유동적으로 알 수 있도록 해준다. 사이즈 변경도 즉각 알려준다. */
                badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
            }
        }
        .scaledToFit() /* 부모에 fit 하도록 사이즈 조정. 비율은 유지한다. */
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
