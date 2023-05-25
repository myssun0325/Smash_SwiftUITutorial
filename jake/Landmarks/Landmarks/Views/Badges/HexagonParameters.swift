//
//  HexagonParameters.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/25.
//

import Foundation
import CoreGraphics

struct HexagonParameters {
    struct Segment {
        let line: CGPoint /* 이전의 마지막 지점에서 직선으로 이동하는 포인트 */
        let curve: CGPoint /* corner에서 Bezier curve를 이용해 움직이는 포인트 */
        let control: CGPoint /* curve의 모양을 컨트롤하는 포인트 */
    }

    static let adjustment: CGFloat = 0.085

    static let segments = [
        Segment(
            line:    CGPoint(x: 0.60, y: 0.05), /* 왼쪽 상단을 기준으로 오른쪽이 x가 +, 아래쪽이 y가 + 되는 방향 */
            curve:   CGPoint(x: 0.40, y: 0.05),
            control: CGPoint(x: 0.50, y: 0.00)
        ),
        Segment(
            line:    CGPoint(x: 0.05, y: 0.20 + adjustment),
            curve:   CGPoint(x: 0.00, y: 0.30 + adjustment),
            control: CGPoint(x: 0.00, y: 0.25 + adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.00, y: 0.70 - adjustment),
            curve:   CGPoint(x: 0.05, y: 0.80 - adjustment),
            control: CGPoint(x: 0.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 0.40, y: 0.95),
            curve:   CGPoint(x: 0.60, y: 0.95),
            control: CGPoint(x: 0.50, y: 1.00)
        ),
        Segment(
            line:    CGPoint(x: 0.95, y: 0.80 - adjustment),
            curve:   CGPoint(x: 1.00, y: 0.70 - adjustment),
            control: CGPoint(x: 1.00, y: 0.75 - adjustment)
        ),
        Segment(
            line:    CGPoint(x: 1.00, y: 0.30 + adjustment),
            curve:   CGPoint(x: 0.95, y: 0.20 + adjustment),
            control: CGPoint(x: 1.00, y: 0.25 + adjustment)
        )
    ]
}
