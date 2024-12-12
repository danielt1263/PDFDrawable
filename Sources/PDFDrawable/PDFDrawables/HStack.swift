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

    public func draw(origin: CGPoint) -> [DrawCommand] {
        let xs = drawables.reduce(into: [origin.x]) { partial, next in
            partial.append(partial.last! + next.size.width)
        }
        return zip(drawables, xs)
            .flatMap { $0.0.draw(origin: CGPoint(x: $0.1, y: origin.y)) }
    }
}
