//
//  FavoriteButton.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/25.
//

import SwiftUI

struct FavoriteButton: View {
    @Binding var isSet: Bool /* Binding에 의해 이 view에서의 변화가 데이터로 거슬러 전파된다. */

    var body: some View {
        Button {
            isSet.toggle()
        } label: {
            Label("Toggle Favorite",  systemImage: isSet ? "star.fill" : "star")
                .labelStyle(.iconOnly)
                .foregroundColor(isSet ? .yellow : .gray)
//            Image(systemName: isSet ? "star.fill" : "star")
//                .foregroundColor(isSet ? .yellow : .gray)
        }
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(isSet: .constant(true)) /* .constant 로 Binding의 고정값을 만들어 넣을 수 있다. */
    }
}

// MARK: - 궁금한 점
/* Image대신 Label을 쓴 이유가 뭘까? -> VoiceOver를 이용해 accessibility를 높이기 위해서인듯 */
