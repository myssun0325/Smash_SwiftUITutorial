//
//  LandmarkRow.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            landmark.image
                .resizable() /* Sets the mode by which SwiftUI resizes an image to fit its space. -> 윈도우 배경화면 늘이기 같은 느낌. 늘리기랑 바둑판 배열을 선택할 수 있음 */
                .frame(width: 50, height: 50)
//                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70)) /* Layout 만 따로 떼서 보여줌 */
    }
}
