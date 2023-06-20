//
//  PaddingTheContainer.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct PaddingTheContainer: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        .padding()
        .background(Color(.blue))
    }
}

#Preview {
    PaddingTheContainer()
}
