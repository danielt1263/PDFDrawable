//
//  VStack.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation

public struct VStack: PDFDrawable {
    public let size: CGSize
    let drawables: [PDFDrawable]

    public init(@PDFDrawableBuilder drawables: () -> [PDFDrawable]) {
        let drawables = drawables()
        self.drawables = drawables
        self.size = drawables.reduce(.zero) { partial, next in
            CGSize(width: max(partial.width, next.size.width), height: partial.height + next.size.height)
        }
    }

    public func draw(context: DrawContext, origin: CGPoint) {
        guard !drawables.isEmpty else { return }
        var y = 0 as CGFloat
        for each in drawables {
            each.draw(context: context, origin: CGPoint(x: origin.x, y: origin.y + y))
            y += each.size.height
        }
    }
}
