//
//  ContentView.swift
//  SwiftUIConceptTutorials
//
//  Created by taehyeon.lee on 2023/06/18.
//

import SwiftUI

struct ContentView: View {
    var body: some View { /* view는 한 개 이상의 visual 요소를 통해서 정의되며, 화면에 표시하는 것. view 계층구조를 이용해 여러 뷰들을 조합해 하나의 뷰를 만든다. */
        VStack { /* VStack의 경우 화면에 보이는 것과 무관하게 내부의 모든 요소를 동시에 그린다. 따라서 subview의 수가 작을 경우에만 사용하는 것이 좋다. 많을 경우엔 LazyVStack을 검토하는 것이 좋다. onscreen인 경우에만 render 처리를 함. HStack 의 경우도 동일. */
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!") /* multiline read-only text */
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
