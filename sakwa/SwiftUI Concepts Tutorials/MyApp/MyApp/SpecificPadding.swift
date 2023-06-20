//
//  SpecificPadding.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct SpecificPadding: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
                .padding(5)
                .background(Color(.blue))
            TrainCar(.front)
        }
    }
}

#Preview {
    SpecificPadding()
}
