//
//  View+CornerRadius.swift
//  pokemon-bottomsheet
//
//  Created by jinreol on 2021/07/06.
//

import SwiftUI

extension View {
    func printView(_ vars: Any...) -> some View {
        for item in vars {
            print(item)
        }
        return EmptyView()
    }

    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
