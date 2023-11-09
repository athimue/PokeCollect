//
//  URLImage.swift
//  PokeCollect
//
//  Created by Clusel Mathieu on 08/11/2023.
//

import SwiftUI

struct URLImage: View {
    let url: String
    let defaultImage: String
    let size: CGFloat
    var body: some View {
        AsyncImage(url: URL(string: url)) {
            phase in
            switch phase {
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: size, maxHeight: size)
                        .shadow(color: .gray, radius: 5, x: 0, y: 0)
                default:
                    Image(systemName: defaultImage)
                        .frame(width: size, height: size)
                        .foregroundColor(.gray)
            }
        }
    }
}
