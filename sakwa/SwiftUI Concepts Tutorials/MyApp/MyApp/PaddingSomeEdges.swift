//
//  PaddingSomeEdges.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct PaddingSomeEdges: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
                .padding([.leading])
                .background(Color(.blue))
            TrainCar(.front)
        }
    }
}

#Preview {
    PaddingSomeEdges()
}
