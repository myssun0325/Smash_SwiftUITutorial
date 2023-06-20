//
//  ZeroSpacing.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct ZeroSpacing: View {
    var body: some View {
        HStack(spacing: 0) {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        
        TrainTrack()
    }
}

#Preview {
    ZeroSpacing()
}
