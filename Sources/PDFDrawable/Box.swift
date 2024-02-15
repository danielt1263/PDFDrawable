//
//  Box.swift
//  PDFDrawable
//
//  Created by Daniel Tartaglia on 2/15/24.
//

import CoreGraphics
import Foundation
import PDFKit

public struct Box: PDFDrawable {
    public let size: CGSize
    let lineWidth: CGFloat
    let strokeColor: CGColor

    public init(size: CGSize, lineWidth: CGFloat, strokeColor: CGColor) {
        self.size = size
        self.lineWidth = lineWidth
        self.strokeColor = strokeColor
    }

    public func draw(context: UIGraphicsPDFRendererContext, origin: CGPoint) {
        let cgContext = context.cgContext
        cgContext.saveGState()
        cgContext.setLineWidth(lineWidth)
        cgContext.setStrokeColor(strokeColor)
        cgContext.addRect(CGRect(origin: origin, size: size))
        cgContext.strokePath()
        cgContext.restoreGState()
    }
}
