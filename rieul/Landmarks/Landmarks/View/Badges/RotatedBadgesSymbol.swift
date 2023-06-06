//
//  RotatedBadgesSymbol.swift
//  Landmarks
//
//  Created by rieul on 2023-05-27.
//  
//

import SwiftUI

struct RotatedBadgesSymbol: View {
    let angle: Angle

    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

struct RotatedBadgesSymbol_Previews: PreviewProvider {
    static var previews: some View {
        RotatedBadgesSymbol(angle: Angle(degrees: 5))
    }
}
