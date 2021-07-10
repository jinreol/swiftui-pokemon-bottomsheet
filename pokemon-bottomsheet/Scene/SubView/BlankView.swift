//
//  BlankView.swift
//  Bottom Sheet 배경 화면
//
//  Created by jinreol on 2021/07/04.
//

import SwiftUI

struct BlankView: View {
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.black)
        .opacity(0.5)
        .ignoresSafeArea()
    }
}
