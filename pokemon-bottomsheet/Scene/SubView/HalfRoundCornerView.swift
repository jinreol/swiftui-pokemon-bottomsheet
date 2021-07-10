//
//  HalfRoundCornerView.swift
//  핸듶바 하단에 붙는 라운드 코너뷰
//
//  Created by jinreol on 2021/07/06.
//

import SwiftUI

struct HalfRoundCornerView: View {
    var screenWidth: CGFloat
    var body: some View {
        Rectangle()
            .background(Color.black)
            .opacity(0.01)
            .frame(width: screenWidth, height: 30)
            .overlay(
                Rectangle()
                    .frame(width: screenWidth, height: 30)
                    .foregroundColor(Color.white)
                    .cornerRadius(30, corners: [.topLeft, .topRight])
            )
    }
}
