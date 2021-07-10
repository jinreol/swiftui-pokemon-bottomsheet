//
//  PokemonDetailView.swift
//  포멧몬 상세정보 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonDetailView: View {
    private let detailFontColor = Color(hex: 0x2E2E2E)
    var pokemonItem: PokemonItem

    var body: some View {
        Text("\(pokemonItem.description)")
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(detailFontColor)
            .padding(.horizontal, 20)

        Text("""
            키 : \(pokemonItem.height)   분류 : \(pokemonItem.kind)   \n
            몸무게 : \(pokemonItem.weight)   특성 : \(pokemonItem.special)
            """)
            .font(.system(size: 15, weight: .medium))
            .foregroundColor(detailFontColor)
            .padding(.top, 20)
            .padding(.horizontal, 25)
            .padding(.bottom, 100)
    }
}
