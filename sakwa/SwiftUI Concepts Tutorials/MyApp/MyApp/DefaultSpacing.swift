//
//  DefaultSpacing.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/20.
//

import SwiftUI

struct DefaultSpacing: View {
    
    var body: some View {
        
        HStack {
            TrainCar(.rear)
            TrainCar(.middle)
                .padding()
                .background(Color(.blue))
            TrainCar(.front)
        }
        
        TrainTrack()
    }
}

#Preview {
    DefaultSpacing()
}
