//
//  PokemonTypesView.swift
//  메인리스트 타입 뷰
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct PokemonTypesView: View {
    private let lightGreenColor = Color(hex: 0x9BBF48)
    private let lightGreen2Color = Color(hex: 0x8DCCC0)
    private let greenColor = Color(hex: 0x7AB766)
    private let purpleColor = Color(hex: 0xA16EC2)
    private let redColor = Color(hex: 0xEFA061)
    private let red2Color = Color(hex: 0xE57879)
    private let blueColor = Color(hex: 0x608FCF)
    private let lightBlueColor = Color(hex: 0x95A8D9)
    private let yellowColor = Color(hex: 0xEDD259)
    private let lightGrayColor = Color(hex: 0x92999F)
    private let pinkColor = Color(hex: 0xDC94E1)
    private let brownColor = Color(hex: 0xCA7C50)

    var types: [PokemonTypeItem]

    private var pokemonTypes = [PokemonType]()

    init(types: [PokemonTypeItem]) {
        self.types = types
        if pokemonTypes.count > 0 {
            pokemonTypes.removeAll()
        }

        for type in types {
            pokemonTypes.append(PokemonType(item: type.item, color: getColor(type: type.item)))
        }
    }

    private func getColor(type: String) -> Color {
        let color: Color
        switch type {
        case "풀": color = self.greenColor
        case "불꽃": color = self.redColor
        case "독": color = self.purpleColor
        case "물": color = self.blueColor
        case "벌레": color = self.lightGreenColor
        case "비행": color = self.lightBlueColor
        case "전기": color = self.yellowColor
        case "노말": color = self.lightGrayColor
        case "페어리": color = self.pinkColor
        case "얼음": color = self.lightGreen2Color
        case "땅": color = self.brownColor
        case "에스퍼": color = self.red2Color
        default: color = self.greenColor
        }
        return color
    }

    var body: some View {
        HStack {
            ForEach(pokemonTypes, id: \.self.id) { type in
                Text("\(type.item)")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color.white)
                    .frame(width: 50, height: 25)
                    .background(type.color)
                    .cornerRadius(5)
            }
        }
            .padding(.top, 5)
            .padding(.horizontal, 10)
            .padding(.bottom, 30)
    }
}

struct PokemonType: Identifiable {
    var id = UUID()
    let item: String
    let color: Color
}
