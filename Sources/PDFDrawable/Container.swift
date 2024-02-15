//
//  Container.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 15 Feb 2024.
//  Copyright © 2024 Daniel Tartaglia. MIT License.
//

import Foundation
import PDFKit

public struct Container: PDFDrawable {
    public let size: CGSize
    let drawables: [PDFDrawable]

    public init(@PDFDrawableBuilder drawables: () -> [PDFDrawable]) {
        let drawables = drawables()
        self.size = drawables.isEmpty ? .zero : drawables.dropFirst()
            .reduce(drawables.first!.size) { partial, next in
                CGSize(width: max(partial.width, next.size.width), height: max(partial.height, next.size.height))
            }
        self.drawables = drawables
    }

    public func draw(context: UIGraphicsPDFRendererContext, origin: CGPoint) {
        for each in drawables {
            each.draw(context: context, origin: origin)
        }
    }
}
