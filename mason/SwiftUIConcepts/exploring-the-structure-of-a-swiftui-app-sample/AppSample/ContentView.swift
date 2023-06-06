/*
See LICENSE folder for this sample’s licensing information.
*/

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.small)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
