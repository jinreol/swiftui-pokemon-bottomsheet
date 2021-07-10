//
//  PokemonBottomSheetView.swift
//  버텀 시트 화면
//
//  Created by jinreol on 2021/07/05.
//

import SwiftUI

struct PokemonBottomSheetView: View {
    @Binding var showBottomSheet: Bool
    @Binding var selectedPokemonItem: PokemonItem?

    @State private var viewState = ViewState.half
    @State private var positionOffset: CGFloat = 0.0

    @GestureState private var dragState = DragState.inactive

    var height: CGFloat
    var width: CGFloat
    var spacing: CGFloat

    var body: some View {
        if self.showBottomSheet {
            BlankView()
                .onTapGesture {
                    self.showBottomSheet = false
                    self.positionOffset = 0
                }

            if let selectedPokemonItem = self.selectedPokemonItem {
                VStack(spacing: 0) {
                    HandleBarView(screenWidth: self.width)
                    HalfRoundCornerView(screenWidth: self.width)
                    ScrollView(.vertical) {
                        if let url = URL(string: selectedPokemonItem.fullImageUrl) {
                            PokemonAsyncImageView(url: url, width: self.width, height: self.width)
                                .padding(self.spacing)
                            PokemonNoView(no: selectedPokemonItem.id)
                            PokemonNameView(name: selectedPokemonItem.name)
                            PokemonTypesView(types: selectedPokemonItem.type)
                            PokemonDetailView(pokemonItem: selectedPokemonItem)
                        }
                    }
                    .background(Color.white)
                    .ignoresSafeArea()
                }
                .offset(y: self.height / 2 + self.dragState.translation.height + self.positionOffset)
                .gesture(
                    DragGesture()
                        .updating(self.$dragState) { value, state, _ in
                            // self.printView("drag:\(value.translation)")
                            state = .dragging(translation: value.translation)
                        }
                        .onEnded({ value in
                            if value.translation.height < -self.height * 0.25 {
                                self.positionOffset = -self.height / 2 + 20
                                self.viewState = .full
                            }

                            if value.translation.height > self.height * 0.3 {
                                self.showBottomSheet = false
                                self.positionOffset = 0
                            }
                        })
                )
                .transition(.offset(x: 0, y: 600))

            }
        }
    }
}
