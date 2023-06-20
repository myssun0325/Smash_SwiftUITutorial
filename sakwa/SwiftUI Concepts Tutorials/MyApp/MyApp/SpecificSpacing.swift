//
//  SpecificSpacing.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct SpecificSpacing: View {
    @ScaledMetric var trainCarSpace = 5
    
    var body: some View {
        HStack(spacing: trainCarSpace) {
            TrainCar(.rear)
            TrainCar(.middle)
            TrainCar(.front)
        }
        
        TrainTrack()
    }
}

#Preview {
    SpecificSpacing()
}
