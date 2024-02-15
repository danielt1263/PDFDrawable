//
//  File.swift
//
//
//  Created by Daniel Tartaglia on 2/15/24.
//

import CoreGraphics
import Foundation

public extension PDFDrawable {
    func framed(padding: CGFloat, lineWidth: CGFloat, strokeColor: CGColor) -> PDFDrawable {
        Container {
            Offseter(x: padding, y: padding, drawable: self)
            Box(
                size: CGSize(width: size.width + 2 * padding, height: size.height + 2 * padding),
                lineWidth: lineWidth,
                strokeColor: strokeColor
            )
        }
    }
}
