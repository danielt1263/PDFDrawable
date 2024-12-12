//
//  Offset.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation


public extension PDFDrawable {
    func offset(x: CGFloat = 0, y: CGFloat = 0) -> PDFDrawable {
        Offsetter(x: x, y: y, drawable: self)
    }
}
