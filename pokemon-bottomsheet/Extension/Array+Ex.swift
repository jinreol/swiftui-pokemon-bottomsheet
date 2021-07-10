//
//  Array+Ex.swift
//  pokemon-bottomsheet
//
//  Created by jinreol on 2021/07/02.
//

import SwiftUI

extension Array {
    subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
}
