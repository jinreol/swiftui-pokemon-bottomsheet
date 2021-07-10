//
//  HandleBarView.swift
//  Bottom Sheet 핸들 화면
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct HandleBarView: View {
    var screenWidth: CGFloat
    var body: some View {
        Rectangle()
            .background(Color.black)
            .opacity(0.01)
            .frame(width: screenWidth, height: 20)
            .overlay(
                Rectangle()
                    .frame(width: 50, height: 5)
                    .foregroundColor(Color(.systemGray3))
            )
    }
}
