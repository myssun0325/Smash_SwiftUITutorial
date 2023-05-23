//
//  MapView.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    /* @State는 해당 데이터가 source of truth 하도록 처리해주는 attribute다. 해당 변수의 값이 변경되면 view가 그에 맞게 변경된다. */
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
        span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )

    var body: some View {
        Map(coordinateRegion: $region) /* State 변수에 $를 붙이면 binding을 전달할 수 있다. map과 interaction을 하면 map이 region 값을 map의 정보에 맞게 즉각 업데이트 해준다. */
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
