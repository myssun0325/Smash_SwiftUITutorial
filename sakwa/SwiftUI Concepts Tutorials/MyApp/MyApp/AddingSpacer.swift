//
//  AddingSpacer.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct AddingSpacer: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            Spacer()
            TrainCar(.middle)
            Spacer()
            TrainCar(.front)
        }
    }
}

#Preview {
    AddingSpacer()
}
