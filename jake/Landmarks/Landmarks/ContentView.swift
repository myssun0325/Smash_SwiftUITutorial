//
//  ContentView.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/22.
//

import SwiftUI

struct ContentView: View { /* View protocol은 View를 리턴하는 body 라는 property를 가지고 있다. */
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider { /* View의 preview를 담당하는 프로토콜 */
    static var previews: some View {
        ContentView()
    }
}
