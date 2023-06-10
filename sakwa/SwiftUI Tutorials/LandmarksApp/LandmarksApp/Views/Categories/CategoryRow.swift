//
//  CategoryRow.swift
//  LandmarksApp
//
//  Created by ChangMin on 2023/05/27.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Landmark]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { landmark in
                        
                        NavigationLink {
                            LandmarkDetail(landmark: landmark)
                        } label: {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
            
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var landmakrs = ModelData().landmarks
    
    static var previews: some View {
        CategoryRow(
            categoryName: landmakrs[0].category.rawValue,
            items: Array(landmakrs.prefix(4))
        )
    }
}
