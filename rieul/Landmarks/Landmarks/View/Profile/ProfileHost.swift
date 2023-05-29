//
//  ProfileHost.swift
//  Landmarks
//
//  Created by rieul on 2023-05-29.
//  
//

import SwiftUI

struct ProfileHost: View {
    @State private var draftProfile: Profile = .default
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: draftProfile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
