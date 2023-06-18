//
//  IfElseTrain.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/18.
//

import SwiftUI

struct IfElseTrain: View {
    var longerTrain: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "train.side.rear.car")
                if longerTrain {
                Image(systemName: "train.side.middle.car")
//                    .opacity(longerTrain ? 1 : 0)
                }
                Image(systemName: "train.side.front.car")
            }
        }
        Divider()
    }
}

#Preview("long Train") {
    IfElseTrain(longerTrain: true)
}

#Preview("short Train") {
    IfElseTrain(longerTrain: false)
}
