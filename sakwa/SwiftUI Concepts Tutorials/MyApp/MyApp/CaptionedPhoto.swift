//
//  CaptionedPhoto.swift
//  MyApp
//
//  Created by ChangMin on 2023/06/14.
//

import SwiftUI

struct CaptionedPhoto: View {
    let assetName: String
    let captionText: String
    
    var body: some View {
        Image(assetName)
            .resizable()
            .scaledToFit()
            .overlay(alignment: .bottom) {
                Caption(text: captionText)
            }
            .clipShape(
                RoundedRectangle(
                    cornerRadius: 10.0,
                    style: .continuous
                )
            )
            .padding()
    }
}

struct Caption: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding()
            .background(
                Color(.textContrast)
                    .opacity(0.75),
                in: RoundedRectangle(
                    cornerRadius: 10.0,
                    style: .continuous
                )
            )
            .padding()
    }
}

let landscapeName = "Landscape"
let landscapeCaption = "This photo is wider than it is tall."
let portraitName = "Portrait"
let portraitCaption = "This photo is taller than it is wide."

#Preview {
    CaptionedPhoto(assetName: portraitName,
                   captionText: portraitCaption)
}

#Preview {
    CaptionedPhoto(assetName: landscapeName,
                   captionText: landscapeCaption)
    .preferredColorScheme(.dark)
}

#Preview {
    CaptionedPhoto(assetName: landscapeName,
                   captionText: landscapeCaption)
    .preferredColorScheme(.light)
}
