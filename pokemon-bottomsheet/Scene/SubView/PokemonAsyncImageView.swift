//
//  PokemonThumbnailView.swift
//  메인리스트 썸네일 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonAsyncImageView: View {
    private let borderColor = Color(hex: 0x999999, alpha: 0.8)
    var url: URL
    var width: CGFloat
    var height: CGFloat
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(borderColor, lineWidth: 1)
            .frame(height: height)
            .overlay(
                AsyncImage(
                    url: url,
                    placeholder: { Text("Loading ...") },
                    image: { Image(uiImage: $0).resizable() }
                )
                .padding(20)
            )
    }
}
