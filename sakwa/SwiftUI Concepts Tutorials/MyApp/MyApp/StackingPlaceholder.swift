//
//  StackingPlaceholder.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct StackingPlaceholder: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            ZStack {
                TrainCar(.middle)
                    .font(.largeTitle)
                    .opacity(0)
                    .background(Color(.blue))
                TrainCar(.middle)
            }
            TrainCar(.front)
        }
    }
}

#Preview {
    StackingPlaceholder()
}
