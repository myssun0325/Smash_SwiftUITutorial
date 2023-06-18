//
//  SwiftUIConceptTutorialsApp.swift
//  SwiftUIConceptTutorials
//
//  Created by taehyeon.lee on 2023/06/18.
//

import SwiftUI

@main /* The entry point(app의 시작 포인트. 2개 이상 선언하면 컴파일 에러남.) */
struct SwiftUIConceptTutorialsApp: App { /* app의 내용과 행동(behavior)정의하도록 채택하는 App 프로토콜 */
    var body: some Scene { /* App프로토콜의 필수 프로퍼티인 body는 Scene이라는 프로토콜로 app을 정의한다. */
        WindowGroup { /* 여러종류의 scene이 있다. WindowGroup, Window, DocumentGroup, Settings */
            ContentView() /* scene이 ContentView를 포함하고 있는 상황. 커스터마이징하여 원하는 뷰를 제작하면 된다. */
        }
    }
}
/* 더 공부해야할 부분 */
/* Scene별 특징과 공통점/차이점 WindowGroup, Window, DocumentGroup, Settings */
/* SwiftUI의 WindowGroup은 플랫폼에 따라 다르게 동작한다. 예를들어 macOS와 iPadOS에서 사용할 때 group에서 window를 한 개 이상 열 수 있다. 그리고 macOS에서는 여러 window 그룹을 한 개의 탭 묶음으로 합칠 수 있다. */
/* 워드 프로세서나 텍스트 에디터와 같은 document base 앱을 만든다면 DocumentGroup scene을 사용하면 된다. */
