//
//  ProfileHost.swift
//  Landmarks
//
//  Created by taehyeon.lee on 2023/05/29.
//

import SwiftUI

struct ProfileHost: View {
    @Environment(\.editMode) var editMode /* SwiftUI에서는 environmet 안에 storage를 제공한다. 해당 값은 @Environmet property wrapper로 접근할 수 있다. multiple view에서 edit모드 변화 감지를 편리하게 할 수 있다. */
    @EnvironmentObject var modelData: ModelData
    @State private var draftProfile = Profile.default

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                if editMode?.wrappedValue == .active {
                    Button("Cancel", role: .cancel) {
                        draftProfile = modelData.profile
                        editMode?.animation().wrappedValue = .inactive /* 왜 animation이 wrappedValue 앞에 붙고 그 값을 바꿔주지? */
                    }
                }
                Spacer()
                EditButton()
            }

            if editMode?.wrappedValue == .inactive {
                ProfileSummary(profile: modelData.profile)
            } else {
                ProfileEditor(profile: $draftProfile)
                    .onAppear {
                        draftProfile = modelData.profile
                    }
                    .onDisappear {
                        modelData.profile = draftProfile
                    }
            }
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData()) /* 내부에서 environmentObject 가 필요해졌기 때문에 없으면 preview fail 됨 */
    }
}
