//
//  ContentView.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/22.
//

import SwiftUI

struct ContentView: View { /* View protocol은 View를 리턴하는 body 라는 property를 가지고 있다. */
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View { /* body property내에서 content, layout, 그리고 behavior를 작성한다. 하지만 오직 View 한 개를 반환하기 때문에 리턴할 때 여러 뷰를 그룹화 시켜서 만들어야 한다. */
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured) /* 특정 태그를 설정 */

            LandmarkList()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
        }
    }
}

struct ContentView_Previews: PreviewProvider { /* View의 preview를 담당하는 프로토콜로 View를 리턴하는 static computed property 인 previews를 가지고 있다. */
    static var previews: some View { /* Canvas에 그릴 View를 정의할 수 있다. */
        ContentView()
            .environmentObject(ModelData())
    }
}

// MARK: - 더 공부해야할 부분
/* @inlinable */
/* @ViewBuilder */
