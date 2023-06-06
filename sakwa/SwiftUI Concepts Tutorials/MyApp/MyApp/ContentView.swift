//
//  ContentView.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/06.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(1..<101) {
                    Subview(number: $0)
                }
            }
            .background(.green)
            .padding(.all, 10)
        }
        .background(.yellow)
        .padding([.top, .bottom], 10)
    }
}

struct Subview: View {
    @State private var number: Int
    
    var body: some View {
        HStack {
            Image(systemName: "airpodsmax")
                .imageScale(.large)
                .foregroundColor(.secondary)
            
            Text("Hello, \(number) world!")
        }
    }
    
    init(number: Int) {
        print("init with \(number)")
        self.number = number
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
