//
//  HStack.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation

public struct HStack: PDFDrawable {
    public let size: CGSize
    let drawables: [PDFDrawable]

    public init(@PDFDrawableBuilder drawables: () -> [PDFDrawable]) {
        let drawables = drawables()
        self.drawables = drawables
        self.size = drawables.reduce(.zero) { partial, next in
            CGSize(width: partial.width + next.size.width, height: max(partial.height, next.size.height))
        }
    }

    public func draw(context: DrawContext, origin: CGPoint) {
        guard !drawables.isEmpty else { return }
        var x = 0 as CGFloat
        for each in drawables {
            each.draw(context: context, origin: CGPoint(x: origin.x + x, y: origin.y))
            x += each.size.width
        }
    }
}
