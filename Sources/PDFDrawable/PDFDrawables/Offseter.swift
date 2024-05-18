//
//  Offseter.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation

public struct Offseter: PDFDrawable {
    public let size: CGSize
    let offset: CGPoint
    let drawable: PDFDrawable

    public init(x: CGFloat = 0, y: CGFloat = 0, drawable: PDFDrawable) {
        self.size = CGSize(width: drawable.size.width + x, height: drawable.size.height + y)
        self.offset = .init(x: x, y: y)
        self.drawable = drawable
    }

    public func draw(context: DrawContext, origin: CGPoint) {
        drawable.draw(context: context, origin: CGPoint(x: origin.x + offset.x, y: origin.y + offset.y))
    }
}
