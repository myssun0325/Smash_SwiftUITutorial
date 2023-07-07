//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by ChangMin on 2023/07/07.
//

import SwiftUI

struct SpeakerArc: Shape {
    let speakerIndex: Int
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
        return 360.0 / Double(totalSpeakers)
    }
    
    private var startAngle: Angle {
        // 시각적 분리?를 위해서 1.0을 더해줌
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
    }
    
    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
    }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: false
            )
        }
    }
}
