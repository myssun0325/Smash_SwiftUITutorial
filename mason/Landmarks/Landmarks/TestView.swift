//
//  TestView.swift
//  Landmarks
//
//  Created by YoungsunMoon on 2023/05/21.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        
        Text("hello")
            .background(.yellow)
            .foregroundColor(.blue)
            .border(.black, width: 5)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
