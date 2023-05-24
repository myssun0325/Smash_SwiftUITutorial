//
//  CircleImage.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/23.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
//        VStack {
            image
                .clipShape(Circle()) /* 일종의 mask 기능. Shape protocol은 path function을 구현하면 된다. Path를 이용해서 원하는 Shape 을 만들 수 있다. */
                .overlay {
                    Circle().stroke(.white, lineWidth: 4)
                }
                .shadow(radius: 7, y: -5)
//            Text("Test")
//                .shadow(color: .red, radius: 1, y: 1)
//        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}

// MARK: - 더 공부할 것들
/* @resultBuilder */
/* @frozen */
