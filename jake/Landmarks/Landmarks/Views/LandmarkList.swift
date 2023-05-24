//
//  LandmarkList.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/24.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView {
            /* Lists는 identifiable data로 동작함.
             data가 identifiable하게 만드는 방법
             1. 각 요소를 유니크하게 표현할 수 있는 프로퍼티를 key path로 제공
             2. data 자체가 Identifiable 프로토콜을 따르도록 함 */
            /* List(landmarks, id: \.id) { landmark in  1번 방식 */
            List(landmarks) { landmark in /* 2번 방식 */
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
