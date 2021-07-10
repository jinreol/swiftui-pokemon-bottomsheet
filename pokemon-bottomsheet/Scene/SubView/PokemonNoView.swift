//
//  PokemonGridNoView.swift
//  메인리스트 넘버 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonNoView: View {
    private let titleFontColor = Color(hex: 0x999999)
    var no: String

    var body: some View {
        Text("No.\(no)")
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(titleFontColor)
            .padding(.horizontal, 20)
    }
}
