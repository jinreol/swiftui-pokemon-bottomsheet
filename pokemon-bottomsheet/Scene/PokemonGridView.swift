//
//  PokemonGridView.swift
//  메인리스트 그리드 뷰
//
//  Created by jinreol on 2021/07/05.
//

import SwiftUI

struct PokemonGridView: View {

    @Binding var showBottomSheet: Bool
    @Binding var selectedPokemonItem: PokemonItem?

    var spacing: CGFloat
    var pokemonList: [PokemonItem]?
    var width: CGFloat

    private var gridItemLayout = [GridItem]()

    init(
        showBottomSheet: Binding<Bool>,
        selectedPokemonItem: Binding<PokemonItem?>,
        spacing: CGFloat,
        pokemonList: [PokemonItem]?,
        width: CGFloat
    ) {
        self.spacing = spacing
        self.pokemonList = pokemonList
        self.width = width
        self._showBottomSheet = showBottomSheet
        self._selectedPokemonItem = selectedPokemonItem

        self.gridItemLayout = [
            GridItem(.flexible(), spacing: self.spacing),
            GridItem(.flexible(), spacing: self.spacing)
        ]
    }

    var body: some View {
        if let pokemonList = self.pokemonList {
            ScrollView {
                LazyVGrid(columns: gridItemLayout, spacing: self.spacing) {
                    ForEach(pokemonList, id: \.self.id) { pokemonItem in
                        PokemonGridCellView(
                            width: width,
                            pokemonItem: pokemonItem)
                            .onTapGesture {
                                // let _ = print("touch")
                                withAnimation(.spring()) {
                                    self.showBottomSheet = true
                                    self.selectedPokemonItem = pokemonItem
                                }

                            }
                    }
                }
            }
            .padding(.top, self.spacing)
            .padding(.horizontal, self.spacing)
        } else {
            EmptyView()
        }

    }
}
