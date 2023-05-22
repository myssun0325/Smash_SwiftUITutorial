//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/22.
//

import SwiftUI

@main /* @main attribute 는 이 앱의 진입점이라는 것을 가르킨다. */
struct LandmarksApp: App { /* 모든 앱에는 app life cycle을 가지는 한 개의 struct(여기선 LandmarksApp)를 가지고 있다. 해당 struct는 App 프로토콜을 채택해야 한다.  */
    var body: some Scene { /* App 프로토콜을 채택한 struct는 body 라는 property를 가지고 있고, 한개 이상의 scene을 return 한다. */
        WindowGroup { /* WindowGroup은 Scene 의 한 구체화.
                       macOS에선 창을 여러개 띄운 뒤 하나의 window에 탭 형태로 묶을 수 있고, iPadOS에선 앱을 여러개 띄울 수 있게 해준다.(iPadOS에선 plist 설정필요) */
            ContentView()
        }
    }
}
