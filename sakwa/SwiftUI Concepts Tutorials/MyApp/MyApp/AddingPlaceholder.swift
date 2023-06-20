//
//  AddingPlaceholder.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct AddingPlaceholder: View {
    var body: some View {
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
                .opacity(0)
                .background(Color(.blue))
            TrainCar(.front)
        }
    }
}

#Preview {
    AddingPlaceholder()
}
