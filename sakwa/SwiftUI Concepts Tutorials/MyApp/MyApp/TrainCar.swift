//
//  TrainCar.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/18.
//

import SwiftUI

enum TrainSymbol: String {
    case front = "train.side.front.car"
    case middle = "train.side.middle.car"
    case rear = "train.side.rear.car"
}

struct TrainCar: View {
    let position: TrainSymbol
    let showFrame: Bool
    
    init(_ position: TrainSymbol, showFrame: Bool = true) {
        self.position = position
        self.showFrame = showFrame
    }
    
    var body: some View {
        Image(systemName: position.rawValue)
            .background(Color(.systemPink))
    }
}

struct TrainTrack: View {
    var body: some View {
        Divider()
            .frame(maxWidth: 200)
    }
}

#Preview {
    TrainCar(.front)
}
