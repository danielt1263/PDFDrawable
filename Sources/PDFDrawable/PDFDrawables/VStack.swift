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

    public func draw(origin: CGPoint) -> [DrawCommand] {
        let ys = drawables.reduce(into: [origin.y]) { partial, next in
            partial.append(partial.last! + next.size.height)
        }
        return zip(drawables, ys)
            .flatMap { $0.0.draw(origin: CGPoint(x: origin.x, y: $0.1)) }
    }
}
