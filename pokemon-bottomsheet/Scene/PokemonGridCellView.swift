//
//  PokemonGridCellView.swift
//  메인리스트 그리드 샐 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonGridCellView: View {
    var width: CGFloat
    var pokemonItem: PokemonItem

    var body: some View {
        VStack(alignment: .leading) {
            // thumbnail
            if let url = URL(string: pokemonItem.imgUrl) {
                PokemonAsyncImageView(url: url, width: width, height: width/2)
            }

            // no
            PokemonNoView(no: pokemonItem.id)

            // name
            PokemonNameView(name: pokemonItem.name)

            // type
            PokemonTypesView(types: pokemonItem.type)
        }
    }
}
