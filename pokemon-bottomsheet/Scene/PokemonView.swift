//
//  ContentView.swift
//  포캣몬 버텀시트 예제
//
//  Created by jinreol on 2021/06/19.
//

import SwiftUI

struct PokemonView: View {
    @ObservedObject private var vm = PokemonViewModel()

    @State var showBottomSheet: Bool = false
    @State var selectedPokemonItem: PokemonItem?

    private let spacing: CGFloat = 10

    var body: some View {
        GeometryReader { geometry in
            // GridView
            PokemonGridView(
                showBottomSheet: self.$showBottomSheet,
                selectedPokemonItem: self.$selectedPokemonItem,
                spacing: self.spacing,
                pokemonList: vm.pokemonlist,
                width: geometry.size.width)

            // BottomSheet
            PokemonBottomSheetView(
                showBottomSheet: self.$showBottomSheet,
                selectedPokemonItem: self.$selectedPokemonItem,
                height: geometry.size.height,
                width: geometry.size.width,
                spacing: self.spacing)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonView()
    }
}
