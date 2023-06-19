//
//  TrailingIconLabelStyle.swift
//  Scrumdinger
//
//  Created by taehyeon.lee on 2023/06/18.
//

import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() } /* LabelStyle이 TrailingIconLabelStyle타입을 반환하도록 도와줌 */
}
