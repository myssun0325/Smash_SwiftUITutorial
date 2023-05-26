//
//  ModelData.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/24.
//

import Foundation
import Combine

final class ModelData: ObservableObject { /* SwiftUI가 subscribe 하는 객체. 해당 객체가 변경되면 어떤 뷰던지 refreshing이 필요하면 갱신된다. */
    @Published var landmarks: [Landmark] = load("landmarkData.json") /* subscriber가 변화를 감지할 수 있도록 data 변화를 publishing 할 수 있도록 함 */
    var hikes: [Hike] = load("hikeData.json")
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data

    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
