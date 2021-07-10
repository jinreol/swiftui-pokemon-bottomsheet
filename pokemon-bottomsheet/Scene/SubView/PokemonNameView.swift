//
//  PokemonNameView.swift
//  메인리스트 네임 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonNameView: View {
    var name: String
    var body: some View {
        Text("\(name)")
            .font(.system(size: 25, weight: .heavy))
            .foregroundColor(Color.black)
            .padding(.top, 5)
            .padding(.horizontal, 20)
    }
}
