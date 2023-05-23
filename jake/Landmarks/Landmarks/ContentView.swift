//
//  ContentView.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/22.
//

import SwiftUI

struct ContentView: View { /* View protocol은 View를 리턴하는 body 라는 property를 가지고 있다. */
    var body: some View { /* body property내에서 content, layout, 그리고 behavior를 작성한다. 하지만 오직 View 한 개를 반환하기 때문에 리턴할 때 여러 뷰를 그룹화 시켜서 만들어야 한다. */
        VStack {
            MapView()
                .ignoresSafeArea(edges: .top) /* ignoresSafeArea가 frame의 위냐 아래냐에 따라 결과가 다르다. 지금 상태는 아래의 frame 계산에 safe area 가 포함되지 않아서 실제론 300 + SafeAreaTop 이다 */
                .frame(height: 300) /* height 만 준다면 width는 자동으로 content사이즈를 따른다. */


            CircleImage()
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) { /* 기본값은 .center */
                Text("Turtle Rock")
                    /* 모든 modifier들은 변경에 맞게 새로운 view를 리턴한다.
                     여러 modifier들이 chain되어 위에서부터 아래 코드대로 쌓인다.
                     작성한 코드는 항상 view에 대해 source of truth 하다. 따라서 modifier를 수정하거나 추가 및 삭제를 할 때마다 바로 그 내용에 맞게 반영된다. */
                    .font(.title) /* font modifier */
    //                .foregroundColor(.green)
                HStack {
                    Text("Joshua Tree National Park")
                    Spacer()
                    Text("California")
                }
                .font(.subheadline) /* modifier가 그룹에 적용되면 그룹내 모든 요소에 영향을 준다. */
                .foregroundColor(.secondary)

                Divider()

                Text("About Turtle Rock")
                    .font(.title2)
                Text("Descriptive text goes here.")
            }
            .padding()

            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider { /* View의 preview를 담당하는 프로토콜로 View를 리턴하는 static computed property 인 previews를 가지고 있다. */
    static var previews: some View { /* Canvas에 그릴 View를 정의할 수 있다. */
        ContentView()
    }
}

// MARK: - 더 공부해야할 부분
/* @inlinable */
/* @ViewBuilder */
