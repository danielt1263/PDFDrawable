//
//  Box.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 2/15/24.
//

import CoreGraphics
import Foundation

public struct Box: PDFDrawable {
    public let size: CGSize
    let lineWidth: CGFloat
    let strokeColor: CGColor

    public init(size: CGSize, lineWidth: CGFloat, strokeColor: CGColor) {
        self.size = size
        self.lineWidth = lineWidth
        self.strokeColor = strokeColor
    }

    public func draw(context: DrawContext, origin: CGPoint) {
        context.drawBox(lineWidth: lineWidth, strokeColor: strokeColor, origin: origin, size: size)
    }
}
